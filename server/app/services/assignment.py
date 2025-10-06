from typing import Optional, Tuple
from uuid import UUID
from sqlalchemy.orm import Session
from sqlalchemy import and_
from datetime import datetime

from app.models.order import Order
from app.models.delivery import Delivery
from app.models.rider_presence import RiderPresence
from app.models.address import Address
from app.services.maps import distance_km
from app.services.notifications import notification_service
import logging

logger = logging.getLogger(__name__)


class RiderAssignmentService:
    """Service for automatically assigning riders to delivery orders."""
    
    def __init__(self, db: Session):
        self.db = db
    
    def find_nearest_available_rider(
        self, pickup_lat: float, pickup_lng: float
    ) -> Optional[Tuple[UUID, float]]:
        """
        Find the nearest available rider to the pickup location.
        Returns (rider_id, distance_km) or None if no riders available.
        """
        available_riders = (
            self.db.query(RiderPresence)
            .filter(RiderPresence.is_available == True)
            .filter(RiderPresence.lat.isnot(None))
            .filter(RiderPresence.lng.isnot(None))
            .all()
        )
        
        if not available_riders:
            return None
        
        # Calculate distances and find nearest
        riders_with_distance = []
        for rider in available_riders:
            dist = distance_km(pickup_lat, pickup_lng, rider.lat, rider.lng)
            riders_with_distance.append((rider.rider_id, dist))
        
        # Sort by distance
        riders_with_distance.sort(key=lambda x: x[1])
        
        return riders_with_distance[0]
    
    async def auto_assign_rider(
        self, order_id: UUID
    ) -> Tuple[bool, Optional[str]]:
        """
        Automatically assign a rider to an order.
        
        Returns:
            (success: bool, message: Optional[str])
        """
        try:
            # Get order details
            order = self.db.query(Order).filter(Order.id == order_id).first()
            if not order:
                return False, "Order not found"
            
            # Get delivery address coordinates
            address = self.db.query(Address).filter(Address.id == order.address_id).first()
            if not address or not address.lat or not address.lng:
                return False, "Delivery address coordinates missing"
            
            # Find nearest available rider
            result = self.find_nearest_available_rider(address.lat, address.lng)
            
            if not result:
                # No riders available - set order to rider_requested
                order.status = "rider_requested"
                self.db.commit()
                logger.info(f"No riders available for order {order_id}, status set to rider_requested")
                return False, "No riders currently available"
            
            rider_id, dist_km = result
            
            # Create delivery record and assign rider (atomic transaction)
            delivery = Delivery(
                order_id=order_id,
                rider_id=rider_id,
                status="assigned",
                pickup_lat=address.lat,
                pickup_lng=address.lng,
                drop_lat=address.lat,
                drop_lng=address.lng,
                distance_km=dist_km,
                fee_pk=int(50 + (dist_km * 20))  # Base 50 PKR + 20 PKR/km
            )
            
            self.db.add(delivery)
            
            # Update order status
            order.status = "rider_assigned"
            
            # Mark rider as busy
            rider_presence = (
                self.db.query(RiderPresence)
                .filter(RiderPresence.rider_id == rider_id)
                .first()
            )
            if rider_presence:
                rider_presence.is_available = False
            
            self.db.commit()
            
            # Send notification to rider
            await notification_service.send_rider_assignment(rider_id, order_id)
            
            logger.info(
                f"✓ Assigned rider {rider_id} to order {order_id} "
                f"(distance: {dist_km:.2f} km)"
            )
            
            return True, f"Rider assigned successfully ({dist_km:.2f} km away)"
            
        except Exception as e:
            self.db.rollback()
            logger.error(f"Error auto-assigning rider: {str(e)}")
            return False, f"Assignment failed: {str(e)}"
    
    async def manual_assign_rider(
        self, order_id: UUID, rider_id: UUID
    ) -> Tuple[bool, Optional[str]]:
        """Manually assign a specific rider to an order."""
        try:
            order = self.db.query(Order).filter(Order.id == order_id).first()
            if not order:
                return False, "Order not found"
            
            # Check if rider exists and is available
            rider_presence = (
                self.db.query(RiderPresence)
                .filter(RiderPresence.rider_id == rider_id)
                .first()
            )
            
            if not rider_presence:
                return False, "Rider not found"
            
            # Get coordinates for distance calculation
            address = self.db.query(Address).filter(Address.id == order.address_id).first()
            dist_km = 0.0
            if address and address.lat and rider_presence.lat:
                dist_km = distance_km(
                    address.lat, address.lng,
                    rider_presence.lat, rider_presence.lng
                )
            
            # Create delivery
            delivery = Delivery(
                order_id=order_id,
                rider_id=rider_id,
                status="assigned",
                pickup_lat=address.lat if address else None,
                pickup_lng=address.lng if address else None,
                drop_lat=address.lat if address else None,
                drop_lng=address.lng if address else None,
                distance_km=dist_km,
                fee_pk=int(50 + (dist_km * 20))
            )
            
            self.db.add(delivery)
            order.status = "rider_assigned"
            rider_presence.is_available = False
            
            self.db.commit()
            
            await notification_service.send_rider_assignment(rider_id, order_id)
            
            return True, "Rider assigned manually"
            
        except Exception as e:
            self.db.rollback()
            logger.error(f"Error in manual assignment: {str(e)}")
            return False, str(e)


from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from uuid import UUID

from app.api.deps import get_db_session
from app.models.delivery import Delivery
from app.models.order import Order
from app.models.rider_presence import RiderPresence
from app.schemas.delivery import DeliveryResponse, UpdateDeliveryStatus
from app.services.notifications import notification_service

router = APIRouter(prefix="/deliveries", tags=["deliveries"])


@router.get("/{delivery_id}", response_model=DeliveryResponse)
def get_delivery(
    delivery_id: UUID,
    db: Session = Depends(get_db_session)
):
    """Get delivery details."""
    delivery = db.query(Delivery).filter(Delivery.id == delivery_id).first()
    if not delivery:
        raise HTTPException(status_code=404, detail="Delivery not found")
    return delivery


@router.post("/{delivery_id}/status", response_model=DeliveryResponse)
async def update_delivery_status(
    delivery_id: UUID,
    status_data: UpdateDeliveryStatus,
    db: Session = Depends(get_db_session)
):
    """Update delivery status (rider)."""
    delivery = db.query(Delivery).filter(Delivery.id == delivery_id).first()
    if not delivery:
        raise HTTPException(status_code=404, detail="Delivery not found")
    
    # Update delivery status
    delivery.status = status_data.status.value
    
    # Update corresponding order status
    order = db.query(Order).filter(Order.id == delivery.order_id).first()
    if order:
        if status_data.status.value == "picked_up":
            order.status = "picked_up"
        elif status_data.status.value == "delivered":
            order.status = "delivered"
            # Mark rider as available again
            rider_presence = db.query(RiderPresence).filter(
                RiderPresence.rider_id == delivery.rider_id
            ).first()
            if rider_presence:
                rider_presence.is_available = True
        
        # Notify buyer of status change
        await notification_service.send_status_update(
            order.buyer_id,
            order.id,
            order.status
        )
    
    db.commit()
    db.refresh(delivery)
    
    return delivery


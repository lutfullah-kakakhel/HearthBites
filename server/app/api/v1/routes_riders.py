from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from uuid import UUID
from datetime import datetime

from app.api.deps import get_db_session
from app.models.rider_presence import RiderPresence
from app.models.delivery import Delivery
from app.schemas.rider import RiderPresenceUpdate, RiderPresenceResponse
from app.schemas.delivery import DeliveryResponse

router = APIRouter(prefix="/rider", tags=["rider"])


@router.post("/presence", response_model=RiderPresenceResponse)
def update_presence(
    rider_id: UUID,
    presence_data: RiderPresenceUpdate,
    db: Session = Depends(get_db_session)
):
    """Update rider presence/availability (heartbeat)."""
    presence = db.query(RiderPresence).filter(
        RiderPresence.rider_id == rider_id
    ).first()
    
    if not presence:
        # Create new presence record
        presence = RiderPresence(
            rider_id=rider_id,
            is_available=presence_data.is_available,
            lat=presence_data.lat,
            lng=presence_data.lng,
            last_seen_at=datetime.utcnow()
        )
        db.add(presence)
    else:
        # Update existing
        presence.is_available = presence_data.is_available
        presence.last_seen_at = datetime.utcnow()
        if presence_data.lat is not None:
            presence.lat = presence_data.lat
        if presence_data.lng is not None:
            presence.lng = presence_data.lng
    
    db.commit()
    db.refresh(presence)
    return presence


@router.get("/tasks", response_model=list[DeliveryResponse])
def get_rider_tasks(
    rider_id: UUID,
    db: Session = Depends(get_db_session)
):
    """Get all assigned tasks for rider."""
    tasks = db.query(Delivery).filter(
        Delivery.rider_id == rider_id,
        Delivery.status.in_(["assigned", "en_route_pickup", "picked_up", "en_route_drop"])
    ).all()
    
    return tasks


@router.get("/available", response_model=list[RiderPresenceResponse])
def list_available_riders(
    db: Session = Depends(get_db_session)
):
    """List all available riders (for manual assignment)."""
    riders = db.query(RiderPresence).filter(
        RiderPresence.is_available == True
    ).all()
    
    return riders


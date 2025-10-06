from uuid import UUID
from datetime import datetime
from pydantic import BaseModel
from typing import Optional


class RiderPresenceUpdate(BaseModel):
    is_available: bool
    lat: Optional[float] = None
    lng: Optional[float] = None


class RiderPresenceResponse(BaseModel):
    rider_id: UUID
    is_available: bool
    last_seen_at: datetime
    lat: Optional[float]
    lng: Optional[float]
    
    model_config = {"from_attributes": True}


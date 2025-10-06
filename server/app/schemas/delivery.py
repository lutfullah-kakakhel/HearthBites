from enum import Enum
from uuid import UUID
from datetime import datetime
from pydantic import BaseModel
from typing import Optional
from decimal import Decimal


class DeliveryStatus(str, Enum):
    REQUESTED = "requested"
    ASSIGNED = "assigned"
    EN_ROUTE_PICKUP = "en_route_pickup"
    PICKED_UP = "picked_up"
    EN_ROUTE_DROP = "en_route_drop"
    DELIVERED = "delivered"
    CONFIRMED = "confirmed"


class UpdateDeliveryStatus(BaseModel):
    status: DeliveryStatus


class DeliveryResponse(BaseModel):
    id: UUID
    order_id: UUID
    rider_id: Optional[UUID]
    status: str
    pickup_lat: Optional[float]
    pickup_lng: Optional[float]
    drop_lat: Optional[float]
    drop_lng: Optional[float]
    distance_km: Optional[Decimal]
    fee_pk: int
    created_at: datetime
    
    model_config = {"from_attributes": True}


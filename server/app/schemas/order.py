from enum import Enum
from uuid import UUID
from datetime import datetime
from pydantic import BaseModel
from typing import Optional


class OrderStatus(str, Enum):
    PENDING = "pending"
    ACCEPTED = "accepted"
    RIDER_REQUESTED = "rider_requested"
    RIDER_ASSIGNED = "rider_assigned"
    PICKED_UP = "picked_up"
    DELIVERED = "delivered"
    READY_FOR_PICKUP = "ready_for_pickup"
    COMPLETED = "completed"
    CANCELLED = "cancelled"


class PaymentMethod(str, Enum):
    CASH = "cash"
    WALLET = "wallet"


class OrderItemCreate(BaseModel):
    menu_item_id: UUID
    qty: int
    unit_price: int


class OrderCreate(BaseModel):
    seller_id: UUID
    address_id: UUID
    delivery_required: bool = False
    payment_method: PaymentMethod = PaymentMethod.CASH
    items: list[OrderItemCreate]


class OrderItemResponse(BaseModel):
    id: UUID
    order_id: UUID
    menu_item_id: UUID
    qty: int
    unit_price: int
    
    model_config = {"from_attributes": True}


class OrderResponse(BaseModel):
    id: UUID
    buyer_id: UUID
    seller_id: UUID
    address_id: UUID
    status: str
    delivery_required: bool
    payment_method: str
    total_amount: int
    created_at: datetime
    
    model_config = {"from_attributes": True}


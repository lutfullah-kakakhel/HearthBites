from uuid import UUID
from datetime import datetime
from pydantic import BaseModel
from typing import Optional


class MenuItemCreate(BaseModel):
    name: str
    photo_url: Optional[str] = None
    category: Optional[str] = None
    price_pk: int
    portion: Optional[str] = None
    is_available: bool = True


class MenuItemUpdate(BaseModel):
    name: Optional[str] = None
    photo_url: Optional[str] = None
    category: Optional[str] = None
    price_pk: Optional[int] = None
    portion: Optional[str] = None
    is_available: Optional[bool] = None


class MenuItemResponse(BaseModel):
    id: UUID
    seller_id: UUID
    name: str
    photo_url: Optional[str]
    category: Optional[str]
    price_pk: int
    portion: Optional[str]
    is_available: bool
    created_at: datetime
    
    model_config = {"from_attributes": True}


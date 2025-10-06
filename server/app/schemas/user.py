from enum import Enum
from uuid import UUID
from datetime import datetime
from pydantic import BaseModel
from typing import Optional


class UserRole(str, Enum):
    BUYER = "buyer"
    SELLER = "seller"
    RIDER = "rider"
    ADMIN = "admin"


class UserCreate(BaseModel):
    role: UserRole
    phone: Optional[str] = None
    name: str
    avatar_url: Optional[str] = None
    locale: str = "en"


class UserResponse(BaseModel):
    id: UUID
    role: str
    phone: Optional[str]
    name: str
    avatar_url: Optional[str]
    rating_avg: float
    locale: str
    created_at: datetime
    
    model_config = {"from_attributes": True}


from sqlalchemy import Column, String, Integer, Boolean, ForeignKey, Index, DateTime
from sqlalchemy.dialects.postgresql import UUID
from datetime import datetime
from uuid import uuid4
from app.db.base import Base


class MenuItem(Base):
    __tablename__ = "menu_items"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    seller_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"))
    name = Column(String, nullable=False)
    photo_url = Column(String)
    category = Column(String)
    price_pk = Column(Integer, nullable=False)
    portion = Column(String)
    is_available = Column(Boolean, default=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    __table_args__ = (
        Index("idx_menu_items_seller", "seller_id", "is_available"),
    )


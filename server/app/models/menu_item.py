from sqlalchemy import Column, String, Integer, Boolean, ForeignKey, text, Index
from sqlalchemy.dialects.postgresql import UUID, TIMESTAMP
from app.db.base import Base


class MenuItem(Base):
    __tablename__ = "menu_items"
    
    id = Column(UUID(as_uuid=True), primary_key=True, server_default=text("gen_random_uuid()"))
    seller_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"))
    name = Column(String, nullable=False)
    photo_url = Column(String)
    category = Column(String)
    price_pk = Column(Integer, nullable=False)
    portion = Column(String)
    is_available = Column(Boolean, default=True)
    created_at = Column(TIMESTAMP(timezone=True), server_default=text("now()"))
    
    __table_args__ = (
        Index("idx_menu_items_seller", "seller_id", "is_available"),
    )


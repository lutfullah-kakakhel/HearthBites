from sqlalchemy import Column, String, Integer, Boolean, ForeignKey, Index, DateTime
from sqlalchemy.dialects.postgresql import UUID
from datetime import datetime
from uuid import uuid4
from app.db.base import Base


class Order(Base):
    __tablename__ = "orders"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    buyer_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    seller_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    address_id = Column(UUID(as_uuid=True), ForeignKey("addresses.id"))
    status = Column(String, default="pending")  # pending, accepted, rider_requested, rider_assigned, picked_up, delivered, ready_for_pickup, completed, cancelled
    delivery_required = Column(Boolean, default=False)
    payment_method = Column(String, default="cash")  # cash, wallet
    total_amount = Column(Integer, nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    __table_args__ = (
        Index("idx_orders_seller_status", "seller_id", "status"),
        Index("idx_orders_buyer_status", "buyer_id", "status"),
    )


class OrderItem(Base):
    __tablename__ = "order_items"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    order_id = Column(UUID(as_uuid=True), ForeignKey("orders.id", ondelete="CASCADE"))
    menu_item_id = Column(UUID(as_uuid=True), ForeignKey("menu_items.id"))
    qty = Column(Integer, nullable=False)
    unit_price = Column(Integer, nullable=False)


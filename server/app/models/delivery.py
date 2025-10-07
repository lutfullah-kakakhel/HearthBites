from sqlalchemy import Column, String, Integer, ForeignKey, Index, Numeric, Double, DateTime
from sqlalchemy.dialects.postgresql import UUID
from datetime import datetime
from uuid import uuid4
from app.db.base import Base


class Delivery(Base):
    __tablename__ = "deliveries"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    order_id = Column(UUID(as_uuid=True), ForeignKey("orders.id", ondelete="CASCADE"))
    rider_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    status = Column(String, default="requested")  # requested, assigned, en_route_pickup, picked_up, en_route_drop, delivered, confirmed
    pickup_lat = Column(Double)
    pickup_lng = Column(Double)
    drop_lat = Column(Double)
    drop_lng = Column(Double)
    distance_km = Column(Numeric(6, 2))
    fee_pk = Column(Integer, default=0)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    __table_args__ = (
        Index("idx_deliveries_rider_status", "rider_id", "status"),
    )


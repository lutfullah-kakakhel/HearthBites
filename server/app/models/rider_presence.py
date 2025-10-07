from sqlalchemy import Column, Boolean, ForeignKey, Index, Double, DateTime
from sqlalchemy.dialects.postgresql import UUID
from datetime import datetime
from app.db.base import Base


class RiderPresence(Base):
    __tablename__ = "rider_presence"
    
    rider_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), primary_key=True)
    is_available = Column(Boolean, default=False)
    last_seen_at = Column(DateTime, default=datetime.utcnow)
    lat = Column(Double)
    lng = Column(Double)
    
    __table_args__ = (
        Index("idx_rider_presence", "is_available", "last_seen_at"),
    )


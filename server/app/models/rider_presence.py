from sqlalchemy import Column, Boolean, ForeignKey, text, Index, Double
from sqlalchemy.dialects.postgresql import UUID, TIMESTAMP
from app.db.base import Base


class RiderPresence(Base):
    __tablename__ = "rider_presence"
    
    rider_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), primary_key=True)
    is_available = Column(Boolean, default=False)
    last_seen_at = Column(TIMESTAMP(timezone=True), server_default=text("now()"))
    lat = Column(Double)
    lng = Column(Double)
    
    __table_args__ = (
        Index("idx_rider_presence", "is_available", "last_seen_at"),
    )


from sqlalchemy import Column, String, Boolean, ForeignKey, Double
from sqlalchemy.dialects.postgresql import UUID
from app.db.base import Base


class Address(Base):
    __tablename__ = "addresses"
    
    id = Column(UUID(as_uuid=True), primary_key=True, server_default="gen_random_uuid()")
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"))
    label = Column(String)
    line1 = Column(String)
    area = Column(String)
    city = Column(String)
    lat = Column(Double)
    lng = Column(Double)
    is_default = Column(Boolean, default=False)


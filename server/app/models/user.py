from sqlalchemy import Column, String, Numeric, text
from sqlalchemy.dialects.postgresql import UUID, TIMESTAMP
from app.db.base import Base


class User(Base):
    __tablename__ = "users"
    
    id = Column(UUID(as_uuid=True), primary_key=True, server_default=text("gen_random_uuid()"))
    role = Column(String, nullable=False)  # buyer, seller, rider, admin
    phone = Column(String)
    name = Column(String, nullable=False)
    avatar_url = Column(String)
    rating_avg = Column(Numeric(3, 2), default=0)
    locale = Column(String, default="en")
    created_at = Column(TIMESTAMP(timezone=True), server_default=text("now()"))


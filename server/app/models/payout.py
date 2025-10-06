from sqlalchemy import Column, String, Integer, ForeignKey, text
from sqlalchemy.dialects.postgresql import UUID, TIMESTAMP
from app.db.base import Base


class Payout(Base):
    __tablename__ = "payouts"
    
    id = Column(UUID(as_uuid=True), primary_key=True, server_default=text("gen_random_uuid()"))
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"))
    role = Column(String)
    amount_pk = Column(Integer, nullable=False)
    method = Column(String)
    external_ref = Column(String)
    status = Column(String, default="pending")
    created_at = Column(TIMESTAMP(timezone=True), server_default=text("now()"))


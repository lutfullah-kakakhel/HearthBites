"""
Unit tests for the rider assignment service.
"""
import pytest
from uuid import uuid4
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from app.db.base import Base
from app.models.user import User
from app.models.address import Address
from app.models.order import Order
from app.models.rider_presence import RiderPresence
from app.services.assignment import RiderAssignmentService


# Use in-memory SQLite for testing
TEST_DATABASE_URL = "sqlite:///:memory:"


@pytest.fixture
def db_session():
    """Create a test database session."""
    engine = create_engine(TEST_DATABASE_URL, echo=False)
    Base.metadata.create_all(engine)
    SessionLocal = sessionmaker(bind=engine)
    session = SessionLocal()
    yield session
    session.close()
    Base.metadata.drop_all(engine)


@pytest.mark.asyncio
async def test_find_nearest_rider(db_session):
    """Test that the service finds the nearest available rider."""
    # Create riders at different distances
    rider1_id = uuid4()
    rider2_id = uuid4()
    rider3_id = uuid4()
    
    # Add users
    db_session.add(User(id=rider1_id, role="rider", name="Rider 1"))
    db_session.add(User(id=rider2_id, role="rider", name="Rider 2"))
    db_session.add(User(id=rider3_id, role="rider", name="Rider 3"))
    
    # Add rider presence (different distances from pickup point 31.5, 74.3)
    db_session.add(RiderPresence(
        rider_id=rider1_id,
        is_available=True,
        lat=31.52,  # ~2km away
        lng=74.32
    ))
    db_session.add(RiderPresence(
        rider_id=rider2_id,
        is_available=True,
        lat=31.48,  # ~5km away
        lng=74.28
    ))
    db_session.add(RiderPresence(
        rider_id=rider3_id,
        is_available=True,
        lat=31.50,  # ~0.5km away (nearest)
        lng=74.30
    ))
    
    db_session.commit()
    
    # Test finding nearest rider
    service = RiderAssignmentService(db_session)
    result = service.find_nearest_available_rider(31.5, 74.3)
    
    assert result is not None
    nearest_rider_id, distance = result
    assert nearest_rider_id == rider3_id  # Should be the nearest one
    assert distance < 1.0  # Less than 1km


@pytest.mark.asyncio
async def test_no_available_riders(db_session):
    """Test behavior when no riders are available."""
    # Create order and address
    buyer_id = uuid4()
    seller_id = uuid4()
    address_id = uuid4()
    order_id = uuid4()
    
    db_session.add(User(id=buyer_id, role="buyer", name="Buyer"))
    db_session.add(User(id=seller_id, role="seller", name="Seller"))
    db_session.add(Address(
        id=address_id,
        user_id=buyer_id,
        lat=31.5,
        lng=74.3
    ))
    db_session.add(Order(
        id=order_id,
        buyer_id=buyer_id,
        seller_id=seller_id,
        address_id=address_id,
        total_amount=500,
        status="accepted"
    ))
    db_session.commit()
    
    # No riders available
    service = RiderAssignmentService(db_session)
    success, message = await service.auto_assign_rider(order_id)
    
    assert success is False
    assert "available" in message.lower()
    
    # Order should be in rider_requested state
    order = db_session.query(Order).filter(Order.id == order_id).first()
    assert order.status == "rider_requested"


@pytest.mark.asyncio
async def test_successful_auto_assignment(db_session):
    """Test successful automatic rider assignment."""
    # Create entities
    buyer_id = uuid4()
    seller_id = uuid4()
    rider_id = uuid4()
    address_id = uuid4()
    order_id = uuid4()
    
    db_session.add(User(id=buyer_id, role="buyer", name="Buyer"))
    db_session.add(User(id=seller_id, role="seller", name="Seller"))
    db_session.add(User(id=rider_id, role="rider", name="Rider"))
    
    db_session.add(Address(
        id=address_id,
        user_id=buyer_id,
        lat=31.5,
        lng=74.3
    ))
    
    db_session.add(Order(
        id=order_id,
        buyer_id=buyer_id,
        seller_id=seller_id,
        address_id=address_id,
        total_amount=500,
        status="accepted"
    ))
    
    db_session.add(RiderPresence(
        rider_id=rider_id,
        is_available=True,
        lat=31.51,
        lng=74.31
    ))
    
    db_session.commit()
    
    # Test auto-assignment
    service = RiderAssignmentService(db_session)
    success, message = await service.auto_assign_rider(order_id)
    
    assert success is True
    assert "assigned" in message.lower()
    
    # Verify order status
    order = db_session.query(Order).filter(Order.id == order_id).first()
    assert order.status == "rider_assigned"
    
    # Verify rider is marked as busy
    rider_presence = db_session.query(RiderPresence).filter(
        RiderPresence.rider_id == rider_id
    ).first()
    assert rider_presence.is_available is False


@pytest.mark.asyncio
async def test_manual_assignment(db_session):
    """Test manual rider assignment."""
    buyer_id = uuid4()
    seller_id = uuid4()
    rider_id = uuid4()
    address_id = uuid4()
    order_id = uuid4()
    
    db_session.add(User(id=buyer_id, role="buyer", name="Buyer"))
    db_session.add(User(id=seller_id, role="seller", name="Seller"))
    db_session.add(User(id=rider_id, role="rider", name="Rider"))
    
    db_session.add(Address(
        id=address_id,
        user_id=buyer_id,
        lat=31.5,
        lng=74.3
    ))
    
    db_session.add(Order(
        id=order_id,
        buyer_id=buyer_id,
        seller_id=seller_id,
        address_id=address_id,
        total_amount=500,
        status="accepted"
    ))
    
    db_session.add(RiderPresence(
        rider_id=rider_id,
        is_available=True,
        lat=31.52,
        lng=74.32
    ))
    
    db_session.commit()
    
    # Manual assignment
    service = RiderAssignmentService(db_session)
    success, message = await service.manual_assign_rider(order_id, rider_id)
    
    assert success is True
    
    # Verify assignment
    order = db_session.query(Order).filter(Order.id == order_id).first()
    assert order.status == "rider_assigned"


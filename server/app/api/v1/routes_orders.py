from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from uuid import UUID
from typing import Optional

from app.api.deps import get_db_session
from app.models.order import Order, OrderItem
from app.schemas.order import OrderCreate, OrderResponse, OrderStatus
from app.services.assignment import RiderAssignmentService
from app.services.notifications import notification_service

router = APIRouter(prefix="/orders", tags=["orders"])


@router.post("/", response_model=OrderResponse, status_code=201)
async def create_order(
    order_data: OrderCreate,
    buyer_id: UUID = Query(..., description="Buyer ID creating the order"),
    db: Session = Depends(get_db_session)
):
    """Create a new order (buyer)."""
    # Calculate total
    total_amount = sum(item.qty * item.unit_price for item in order_data.items)
    
    # Create order
    order = Order(
        buyer_id=buyer_id,
        seller_id=order_data.seller_id,
        address_id=order_data.address_id,
        delivery_required=order_data.delivery_required,
        payment_method=order_data.payment_method.value,
        total_amount=total_amount,
        status="pending"
    )
    db.add(order)
    db.flush()  # Get order ID
    
    # Create order items
    for item_data in order_data.items:
        order_item = OrderItem(
            order_id=order.id,
            menu_item_id=item_data.menu_item_id,
            qty=item_data.qty,
            unit_price=item_data.unit_price
        )
        db.add(order_item)
    
    db.commit()
    db.refresh(order)
    
    # Notify seller
    await notification_service.send_order_notification(
        order.seller_id,
        "New Order",
        f"You have a new order #{order.id}",
        {"order_id": str(order.id)}
    )
    
    return order


@router.get("/{order_id}", response_model=OrderResponse)
def get_order(
    order_id: UUID,
    db: Session = Depends(get_db_session)
):
    """Get order by ID."""
    order = db.query(Order).filter(Order.id == order_id).first()
    if not order:
        raise HTTPException(status_code=404, detail="Order not found")
    return order


@router.get("/", response_model=list[OrderResponse])
def list_orders(
    buyer_id: Optional[UUID] = Query(None),
    seller_id: Optional[UUID] = Query(None),
    status: Optional[str] = Query(None),
    db: Session = Depends(get_db_session)
):
    """List orders with optional filters."""
    query = db.query(Order)
    
    if buyer_id:
        query = query.filter(Order.buyer_id == buyer_id)
    if seller_id:
        query = query.filter(Order.seller_id == seller_id)
    if status:
        query = query.filter(Order.status == status)
    
    return query.order_by(Order.created_at.desc()).all()


@router.post("/{order_id}/accept", response_model=OrderResponse)
async def accept_order(
    order_id: UUID,
    db: Session = Depends(get_db_session)
):
    """Accept order (seller)."""
    order = db.query(Order).filter(Order.id == order_id).first()
    if not order:
        raise HTTPException(status_code=404, detail="Order not found")
    
    if order.status != "pending":
        raise HTTPException(status_code=400, detail="Order already processed")
    
    order.status = "accepted"
    
    # If delivery required, auto-assign rider
    if order.delivery_required:
        assignment_service = RiderAssignmentService(db)
        success, message = await assignment_service.auto_assign_rider(order_id)
        # Status updated by assignment service
    
    db.commit()
    db.refresh(order)
    
    # Notify buyer
    await notification_service.send_status_update(
        order.buyer_id,
        order_id,
        order.status
    )
    
    return order


@router.post("/{order_id}/reject", response_model=OrderResponse)
async def reject_order(
    order_id: UUID,
    db: Session = Depends(get_db_session)
):
    """Reject order (seller)."""
    order = db.query(Order).filter(Order.id == order_id).first()
    if not order:
        raise HTTPException(status_code=404, detail="Order not found")
    
    order.status = "cancelled"
    db.commit()
    db.refresh(order)
    
    await notification_service.send_status_update(
        order.buyer_id,
        order_id,
        "cancelled"
    )
    
    return order


@router.post("/{order_id}/request-rider")
async def request_rider(
    order_id: UUID,
    db: Session = Depends(get_db_session)
):
    """Request rider for order (auto-assignment)."""
    assignment_service = RiderAssignmentService(db)
    success, message = await assignment_service.auto_assign_rider(order_id)
    
    if not success:
        return {"success": False, "message": message}, 202
    
    return {"success": True, "message": message}


@router.post("/{order_id}/assign-rider")
async def assign_rider_manually(
    order_id: UUID,
    rider_id: UUID = Query(...),
    db: Session = Depends(get_db_session)
):
    """Manually assign rider to order (seller)."""
    assignment_service = RiderAssignmentService(db)
    success, message = await assignment_service.manual_assign_rider(order_id, rider_id)
    
    if not success:
        raise HTTPException(status_code=400, detail=message)
    
    return {"success": True, "message": message}


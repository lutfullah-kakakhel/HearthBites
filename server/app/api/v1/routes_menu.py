from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from uuid import UUID
from typing import Optional

from app.api.deps import get_db_session, get_current_user
from app.models.menu_item import MenuItem
from app.schemas.menu import MenuItemCreate, MenuItemUpdate, MenuItemResponse

router = APIRouter(prefix="/menu", tags=["menu"])


@router.get("/", response_model=list[MenuItemResponse])
def list_menu_items(
    seller_id: Optional[UUID] = Query(None),
    is_available: Optional[bool] = Query(None),
    db: Session = Depends(get_db_session)
):
    """Get menu items, optionally filtered by seller and availability."""
    query = db.query(MenuItem)
    
    if seller_id:
        query = query.filter(MenuItem.seller_id == seller_id)
    if is_available is not None:
        query = query.filter(MenuItem.is_available == is_available)
    
    return query.all()


@router.post("/", response_model=MenuItemResponse, status_code=201)
def create_menu_item(
    item_data: MenuItemCreate,
    seller_id: UUID = Query(..., description="Seller ID creating the item"),
    db: Session = Depends(get_db_session)
):
    """Create a new menu item (seller only)."""
    menu_item = MenuItem(
        seller_id=seller_id,
        **item_data.model_dump()
    )
    db.add(menu_item)
    db.commit()
    db.refresh(menu_item)
    return menu_item


@router.patch("/{item_id}", response_model=MenuItemResponse)
def update_menu_item(
    item_id: UUID,
    item_data: MenuItemUpdate,
    db: Session = Depends(get_db_session)
):
    """Update menu item (seller only)."""
    menu_item = db.query(MenuItem).filter(MenuItem.id == item_id).first()
    if not menu_item:
        raise HTTPException(status_code=404, detail="Menu item not found")
    
    # Update only provided fields
    update_data = item_data.model_dump(exclude_unset=True)
    for key, value in update_data.items():
        setattr(menu_item, key, value)
    
    db.commit()
    db.refresh(menu_item)
    return menu_item


@router.delete("/{item_id}", status_code=204)
def delete_menu_item(
    item_id: UUID,
    db: Session = Depends(get_db_session)
):
    """Delete menu item (seller only)."""
    menu_item = db.query(MenuItem).filter(MenuItem.id == item_id).first()
    if not menu_item:
        raise HTTPException(status_code=404, detail="Menu item not found")
    
    db.delete(menu_item)
    db.commit()
    return None


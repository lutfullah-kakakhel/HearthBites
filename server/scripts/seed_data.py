"""
Seed script to populate the database with sample data.
Run with: python -m scripts.seed_data
"""
import sys
import os
from uuid import uuid4

# Add parent directory to path
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))

from app.db.session import SessionLocal
from app.models.user import User
from app.models.address import Address
from app.models.menu_item import MenuItem
from app.models.order import Order, OrderItem
from app.models.rider_presence import RiderPresence


def seed_database():
    """Seed the database with sample data."""
    db = SessionLocal()
    
    try:
        print("🌱 Seeding database...")
        
        # Create users
        print("Creating users...")
        
        # Sellers
        seller1 = User(
            id=uuid4(),
            role="seller",
            phone="+923001234567",
            name="Fatima's Kitchen",
            avatar_url="https://i.pravatar.cc/150?img=1",
            rating_avg=4.8,
            locale="ur"
        )
        seller2 = User(
            id=uuid4(),
            role="seller",
            phone="+923001234568",
            name="Zainab's Delights",
            avatar_url="https://i.pravatar.cc/150?img=2",
            rating_avg=4.6,
            locale="ur"
        )
        
        # Buyers
        buyer1 = User(
            id=uuid4(),
            role="buyer",
            phone="+923009876543",
            name="Ahmed Ali",
            avatar_url="https://i.pravatar.cc/150?img=11",
            locale="ur"
        )
        buyer2 = User(
            id=uuid4(),
            role="buyer",
            phone="+923009876544",
            name="Sara Khan",
            avatar_url="https://i.pravatar.cc/150?img=12",
            locale="en"
        )
        
        # Rider
        rider1 = User(
            id=uuid4(),
            role="rider",
            phone="+923005555555",
            name="Bilal Hussain",
            avatar_url="https://i.pravatar.cc/150?img=21",
            rating_avg=4.9,
            locale="ur"
        )
        
        db.add_all([seller1, seller2, buyer1, buyer2, rider1])
        db.commit()
        
        # Create addresses
        print("Creating addresses...")
        
        seller1_address = Address(
            user_id=seller1.id,
            label="Home Kitchen",
            line1="House 123, Street 45",
            area="Johar Town",
            city="Lahore",
            lat=31.4697,
            lng=74.2728,
            is_default=True
        )
        
        buyer1_address = Address(
            user_id=buyer1.id,
            label="Home",
            line1="House 456, Street 78",
            area="Model Town",
            city="Lahore",
            lat=31.4825,
            lng=74.3214,
            is_default=True
        )
        
        buyer2_address = Address(
            user_id=buyer2.id,
            label="Office",
            line1="Office 789, Main Boulevard",
            area="Gulberg",
            city="Lahore",
            lat=31.5204,
            lng=74.3587,
            is_default=True
        )
        
        db.add_all([seller1_address, buyer1_address, buyer2_address])
        db.commit()
        
        # Create menu items
        print("Creating menu items...")
        
        menu_items = [
            MenuItem(
                seller_id=seller1.id,
                name="Chicken Biryani",
                photo_url="https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8",
                category="Main Course",
                price_pk=450,
                portion="1 plate (500g)",
                is_available=True
            ),
            MenuItem(
                seller_id=seller1.id,
                name="Beef Nihari",
                photo_url="https://images.unsplash.com/photo-1585937421612-70a008356fbe",
                category="Main Course",
                price_pk=550,
                portion="1 bowl",
                is_available=True
            ),
            MenuItem(
                seller_id=seller1.id,
                name="Gulab Jamun",
                photo_url="https://images.unsplash.com/photo-1589301773859-b0c3d26c7c5a",
                category="Dessert",
                price_pk=150,
                portion="4 pieces",
                is_available=True
            ),
            MenuItem(
                seller_id=seller2.id,
                name="Chicken Karahi",
                photo_url="https://images.unsplash.com/photo-1603894584373-5ac82b2ae398",
                category="Main Course",
                price_pk=650,
                portion="1kg",
                is_available=True
            ),
            MenuItem(
                seller_id=seller2.id,
                name="Daal Chawal",
                photo_url="https://images.unsplash.com/photo-1546833998-877b37c2e5c6",
                category="Main Course",
                price_pk=250,
                portion="1 plate",
                is_available=True
            ),
            MenuItem(
                seller_id=seller2.id,
                name="Kheer",
                photo_url="https://images.unsplash.com/photo-1588137378633-dea1336ce1e2",
                category="Dessert",
                price_pk=120,
                portion="1 bowl",
                is_available=False
            ),
        ]
        
        db.add_all(menu_items)
        db.commit()
        
        # Create sample orders
        print("Creating sample orders...")
        
        # Order 1: Pending
        order1 = Order(
            buyer_id=buyer1.id,
            seller_id=seller1.id,
            address_id=buyer1_address.id,
            status="pending",
            delivery_required=True,
            payment_method="cash",
            total_amount=600
        )
        db.add(order1)
        db.flush()
        
        db.add(OrderItem(
            order_id=order1.id,
            menu_item_id=menu_items[0].id,
            qty=1,
            unit_price=450
        ))
        db.add(OrderItem(
            order_id=order1.id,
            menu_item_id=menu_items[2].id,
            qty=1,
            unit_price=150
        ))
        
        # Order 2: Rider assigned
        order2 = Order(
            buyer_id=buyer2.id,
            seller_id=seller2.id,
            address_id=buyer2_address.id,
            status="rider_assigned",
            delivery_required=True,
            payment_method="cash",
            total_amount=650
        )
        db.add(order2)
        db.flush()
        
        db.add(OrderItem(
            order_id=order2.id,
            menu_item_id=menu_items[3].id,
            qty=1,
            unit_price=650
        ))
        
        # Order 3: Delivered
        order3 = Order(
            buyer_id=buyer1.id,
            seller_id=seller2.id,
            address_id=buyer1_address.id,
            status="delivered",
            delivery_required=True,
            payment_method="cash",
            total_amount=370
        )
        db.add(order3)
        db.flush()
        
        db.add(OrderItem(
            order_id=order3.id,
            menu_item_id=menu_items[4].id,
            qty=1,
            unit_price=250
        ))
        db.add(OrderItem(
            order_id=order3.id,
            menu_item_id=menu_items[5].id,
            qty=1,
            unit_price=120
        ))
        
        # Create rider presence
        print("Creating rider presence...")
        
        rider_presence = RiderPresence(
            rider_id=rider1.id,
            is_available=True,
            lat=31.4905,
            lng=74.3000
        )
        db.add(rider_presence)
        
        db.commit()
        
        print("✅ Database seeded successfully!")
        print(f"\nCreated:")
        print(f"  - 5 users (2 sellers, 2 buyers, 1 rider)")
        print(f"  - 3 addresses")
        print(f"  - 6 menu items")
        print(f"  - 3 sample orders")
        print(f"\nTest credentials:")
        print(f"  Seller 1: {seller1.phone} (Fatima's Kitchen)")
        print(f"  Seller 2: {seller2.phone} (Zainab's Delights)")
        print(f"  Buyer 1: {buyer1.phone} (Ahmed Ali)")
        print(f"  Buyer 2: {buyer2.phone} (Sara Khan)")
        print(f"  Rider: {rider1.phone} (Bilal Hussain)")
        
    except Exception as e:
        print(f"❌ Error seeding database: {e}")
        db.rollback()
    finally:
        db.close()


if __name__ == "__main__":
    seed_database()


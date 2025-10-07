# HearthBites - Complete Testing Guide

## 🎯 Quick Test (5 Minutes)

Want to see it working right away? Follow these steps:

### Backend Test (2 minutes)

```bash
cd /home/l3k/HearthBites/server

# 1. Setup virtual environment
python3 -m venv .venv
source .venv/bin/activate

# 2. Install dependencies
pip install -e .

# 3. Create database (choose one):
# Option A: Local PostgreSQL
createdb hearthbites

# Option B: Use SQLite for quick testing
# Edit server/app/core/config.py and set:
# database_url: str = "sqlite:///./test.db"

# 4. Create .env file
cat > .env << 'EOF'
DATABASE_URL=postgresql://postgres:password@localhost:5432/hearthbites
SUPABASE_JWT_SECRET=
EOF

# 5. Run migrations
alembic upgrade head

# 6. Seed sample data
python -m scripts.seed_data

# 7. Start server
uvicorn app.main:app --reload
```

✅ **Backend is running!** Visit http://localhost:8000/docs

### Frontend Test (3 minutes)

**Open a new terminal:**

```bash
cd /home/l3k/HearthBites/app

# 1. Install Flutter dependencies
flutter pub get

# 2. Generate code (Freezed models)
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Run on Chrome (fastest for testing)
flutter run -d chrome

# Or run on Android emulator
flutter run
```

✅ **App is running!** You should see the menu screen.

---

## 🔍 Detailed Testing Instructions

### Part 1: Backend Testing

#### 1.1 Test API Endpoints

**Visit the API documentation:**
```
http://localhost:8000/docs
```

**Try these endpoints:**

1. **Health Check**
   ```bash
   curl http://localhost:8000/health
   # Should return: {"status":"healthy"}
   ```

2. **Get Menu Items**
   ```bash
   curl http://localhost:8000/api/v1/menu
   # Should return array of 6 menu items
   ```

3. **Create a Test User**
   - Open http://localhost:8000/docs
   - Click on `POST /api/v1/users/`
   - Click "Try it out"
   - Use this JSON:
   ```json
   {
     "role": "buyer",
     "phone": "+923001111111",
     "name": "Test User",
     "locale": "en"
   }
   ```
   - Click "Execute"

4. **Create an Order** (via Swagger UI)
   - Navigate to `POST /api/v1/orders`
   - Use sample data from the docs

#### 1.2 Test Rider Assignment

```bash
# In Python shell
cd server
source .venv/bin/activate
python

# Then run:
from app.db.session import SessionLocal
from app.services.assignment import RiderAssignmentService
from uuid import UUID

db = SessionLocal()
service = RiderAssignmentService(db)

# Test finding riders
result = service.find_nearest_available_rider(31.5, 74.3)
print(f"Found rider: {result}")
```

#### 1.3 Run Backend Tests

```bash
cd server
source .venv/bin/activate

# Install dev dependencies
pip install -e ".[dev]"

# Run all tests
pytest -v

# Run with coverage
pytest --cov=app tests/

# Run specific test
pytest tests/test_assignment.py -v
```

Expected output:
```
test_find_nearest_rider PASSED
test_no_available_riders PASSED
test_successful_auto_assignment PASSED
test_manual_assignment PASSED
```

### Part 2: Frontend Testing

#### 2.1 Run on Different Platforms

**Chrome (Web - Fastest for testing):**
```bash
cd app
flutter run -d chrome
```

**Android Emulator:**
```bash
# Start emulator first
# Android Studio → AVD Manager → Launch emulator

# Then run:
flutter run
```

**Physical Android Device:**
```bash
# 1. Enable USB debugging on your phone
# 2. Connect via USB
# 3. Run:
flutter devices  # Should show your device
flutter run
```

**iOS Simulator (Mac only):**
```bash
open -a Simulator
flutter run
```

#### 2.2 Test Flutter Code

**Run static analysis:**
```bash
cd app
flutter analyze
```

**Run tests (when you add them):**
```bash
flutter test
```

**Check for outdated packages:**
```bash
flutter pub outdated
```

### Part 3: End-to-End Testing

#### 3.1 Buyer Flow Test

1. **Browse Menu**
   - Launch app → Should see home screen
   - Should display 6 menu items with images
   - Items: Chicken Biryani, Beef Nihari, Gulab Jamun, etc.

2. **View Item Details**
   - Tap any item (e.g., "Chicken Biryani")
   - Should show:
     - Photo
     - Price (PKR 450)
     - Portion size
     - Quantity selector
     - "Add to Cart" button

3. **Add to Cart**
   - Adjust quantity (try +/- buttons)
   - Tap "Add to Cart"
   - Should see confirmation
   - Cart badge should show "1"

4. **View Cart**
   - Tap cart icon (top right)
   - Should show added items
   - Test quantity adjustment
   - Test remove button
   - Check total calculation

5. **Checkout**
   - Tap "Proceed to Checkout"
   - Select "Delivery" or "Pickup"
   - Select "Cash" payment
   - Review total amount
   - Tap "Place Order"

6. **Track Order**
   - Should auto-navigate to order status
   - Should show order details
   - Status timeline should display
   - Try "Refresh Status" button

#### 3.2 Seller Flow Test

**Change the route to seller dashboard:**

Edit `app/lib/main.dart` or use deep linking:

1. **Dashboard**
   - Should see list of menu items
   - Toggle switches for availability
   - FAB button to add items

2. **Add Menu Item**
   - Tap FAB (+) button
   - Fill in form:
     - Name: "Test Item"
     - Price: 300
     - Category: "Dessert"
     - Portion: "1 piece"
   - Tap "Create Item"
   - Should appear in list

3. **Edit Menu Item**
   - Tap edit icon on any item
   - Change price or availability
   - Save changes
   - Verify changes persist

4. **View Orders**
   - Tap orders icon (top right)
   - Should see incoming orders
   - Orders should show:
     - Order number
     - Total amount
     - Payment method
     - Status badge

5. **Accept Order**
   - Tap "Accept" on a pending order
   - Should trigger rider assignment
   - Status should change to "accepted" or "rider_assigned"

#### 3.3 Rider Flow Test

**Change route to rider screens:**

1. **Toggle Availability**
   - See availability switch in app bar
   - Toggle ON → Should update status
   - Toast message: "You are now available"

2. **View Tasks**
   - Should see list of assigned deliveries
   - Each showing:
     - Task number
     - Distance
     - Fee
     - Status

3. **Task Details**
   - Tap on a task
   - Should show:
     - Delivery info
     - Distance and fee
     - Navigation button
     - Call buttons
     - Status update buttons

4. **Update Status**
   - Tap "Mark as Picked Up"
   - Status should update
   - Tap "Mark as Delivered"
   - Task should complete
   - Availability should reset to available

### Part 4: API Testing with cURL

#### 4.1 Menu Operations

```bash
# Get all menu items
curl http://localhost:8000/api/v1/menu

# Get seller's menu
curl "http://localhost:8000/api/v1/menu?seller_id=<SELLER_UUID>"

# Get only available items
curl "http://localhost:8000/api/v1/menu?is_available=true"
```

#### 4.2 Order Operations

```bash
# Create order (replace UUIDs with actual values)
curl -X POST http://localhost:8000/api/v1/orders?buyer_id=<BUYER_UUID> \
  -H "Content-Type: application/json" \
  -d '{
    "seller_id": "<SELLER_UUID>",
    "address_id": "<ADDRESS_UUID>",
    "delivery_required": true,
    "payment_method": "cash",
    "items": [
      {
        "menu_item_id": "<ITEM_UUID>",
        "qty": 1,
        "unit_price": 450
      }
    ]
  }'

# Get order
curl http://localhost:8000/api/v1/orders/<ORDER_UUID>

# Accept order
curl -X POST http://localhost:8000/api/v1/orders/<ORDER_UUID>/accept
```

#### 4.3 Rider Operations

```bash
# Update rider presence
curl -X POST "http://localhost:8000/api/v1/rider/presence?rider_id=<RIDER_UUID>" \
  -H "Content-Type: application/json" \
  -d '{
    "is_available": true,
    "lat": 31.5,
    "lng": 74.3
  }'

# Get rider tasks
curl "http://localhost:8000/api/v1/rider/tasks?rider_id=<RIDER_UUID>"

# Get available riders
curl http://localhost:8000/api/v1/rider/available
```

### Part 5: Database Testing

#### 5.1 Check Seeded Data

```bash
# Connect to database
psql -U postgres -d hearthbites

# Or if using PostgreSQL with authentication:
psql postgresql://postgres:password@localhost:5432/hearthbites
```

**Run these SQL queries:**

```sql
-- Check users
SELECT id, role, name, phone FROM users;

-- Check menu items
SELECT id, name, price_pk, is_available FROM menu_items;

-- Check orders
SELECT id, status, total_amount, delivery_required FROM orders;

-- Check rider presence
SELECT rider_id, is_available, lat, lng FROM rider_presence;

-- Check deliveries
SELECT id, order_id, rider_id, status, distance_km, fee_pk FROM deliveries;
```

#### 5.2 Test Data Integrity

```sql
-- Orders should have valid references
SELECT o.id, o.status, u_buyer.name as buyer, u_seller.name as seller
FROM orders o
JOIN users u_buyer ON o.buyer_id = u_buyer.id
JOIN users u_seller ON o.seller_id = u_seller.id;

-- Menu items should belong to sellers
SELECT m.name, u.name as seller_name
FROM menu_items m
JOIN users u ON m.seller_id = u.id
WHERE u.role = 'seller';
```

### Part 6: Performance Testing

#### 6.1 Backend Load Test (Optional)

```bash
# Install apache bench
sudo apt-get install apache2-utils

# Test health endpoint
ab -n 1000 -c 10 http://localhost:8000/health

# Test menu endpoint
ab -n 1000 -c 10 http://localhost:8000/api/v1/menu
```

#### 6.2 Flutter Performance

```bash
# Run in profile mode
flutter run --profile

# Check performance in DevTools
flutter pub global activate devtools
flutter pub global run devtools
```

---

## 🐛 Common Issues & Solutions

### Backend Issues

**Issue: `ModuleNotFoundError: No module named 'app'`**
```bash
cd server
pip install -e .
```

**Issue: `relation "users" does not exist`**
```bash
cd server
alembic upgrade head
```

**Issue: `No module named 'alembic'`**
```bash
pip install alembic
```

**Issue: Database connection error**
```bash
# Check PostgreSQL is running
sudo service postgresql status

# Start PostgreSQL
sudo service postgresql start

# Or use SQLite for quick testing (edit config.py)
```

### Frontend Issues

**Issue: `Target of URI doesn't exist`**
```bash
cd app
flutter pub run build_runner build --delete-conflicting-outputs
```

**Issue: `MissingPluginException`**
```bash
flutter clean
flutter pub get
flutter run
```

**Issue: Cannot connect to API**
- Check backend is running: `curl http://localhost:8000/health`
- For Android emulator: Use `http://10.0.2.2:8000` in `lib/core/env.dart`
- For iOS simulator: Use `http://localhost:8000`
- For physical device: Use your computer's IP address

**Issue: Freezed files not generating**
```bash
flutter pub add freezed_annotation
flutter pub add --dev build_runner
flutter pub add --dev freezed
flutter pub add --dev json_serializable
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## ✅ Test Checklist

Use this checklist to ensure everything works:

### Backend ✅
- [ ] Server starts without errors
- [ ] Health endpoint returns 200
- [ ] Swagger UI loads at /docs
- [ ] Database connection successful
- [ ] Seed data loaded (6 menu items, 5 users)
- [ ] Can create a user via API
- [ ] Can list menu items
- [ ] Can create an order
- [ ] Rider assignment works
- [ ] Unit tests pass

### Frontend ✅
- [ ] App builds without errors
- [ ] No analyzer warnings
- [ ] Home screen displays menu items
- [ ] Images load correctly
- [ ] Can add items to cart
- [ ] Cart badge updates
- [ ] Checkout flow works
- [ ] Order placement succeeds
- [ ] Can switch between screens
- [ ] Language toggle works (EN/UR)

### Integration ✅
- [ ] Frontend connects to backend
- [ ] Menu items load from API
- [ ] Orders save to database
- [ ] Status updates reflect in app
- [ ] Notifications logged to console

---

## 🎯 Quick Sanity Test

Run this to verify everything is set up correctly:

```bash
# Terminal 1: Backend
cd /home/l3k/HearthBites/server
source .venv/bin/activate
uvicorn app.main:app --reload

# Terminal 2: Test API
curl http://localhost:8000/health
curl http://localhost:8000/api/v1/menu | jq

# Terminal 3: Frontend
cd /home/l3k/HearthBites/app
flutter run -d chrome
```

If all three work, you're good to go! 🎉

---

## 📊 Expected Results

**Backend logs should show:**
```
INFO:     Uvicorn running on http://127.0.0.1:8000
INFO:     Started reloader process
INFO:     Application startup complete
```

**Database should have:**
- 5 users (2 sellers, 2 buyers, 1 rider)
- 3 addresses
- 6 menu items
- 3 sample orders

**Frontend should show:**
- Grid of menu items
- Item cards with images
- Functional cart
- Working navigation

---

## 🚀 Next Steps After Testing

1. **Customize the data** - Edit seed script
2. **Add your own menu items** - Via seller dashboard
3. **Test on real device** - Build APK and install
4. **Deploy backend** - Railway, Heroku, etc.
5. **Gather feedback** - Test with real users

---

**Happy Testing! 🧪** If you encounter any issues, refer to SETUP_GUIDE.md or ask for help!



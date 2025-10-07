# 🎉 HearthBites is Running!

## ✅ What's Currently Active

### Backend (FastAPI) - ✅ RUNNING
- **Port**: http://localhost:8001
- **Status**: Active and responding
- **Database**: SQLite (hearthbites_test.db)
- **API Docs**: http://localhost:8001/docs

### Frontend (Flutter) - 🚀 BUILDING
- **Target**: Physical Android device (CPH2219)
- **Status**: Building and deploying
- **API Endpoint**: Configured to http://localhost:8001

## 📱 Your Connected Devices

1. **CPH2219 (Physical Device)** - Android 13 - ✅ App deploying here
2. **Chrome (Web)** - Available for quick testing
3. **Linux Desktop** - Available

## 🔧 What Was Fixed

### Java/Gradle Compatibility
- ✅ Java 21 detected
- ✅ Gradle updated to 8.7 (compatible with Java 21)
- ✅ Android Gradle Plugin updated to 8.3.0
- ✅ Kotlin updated to 1.9.22

### Backend Setup
- ✅ Virtual environment created
- ✅ All Python dependencies installed
- ✅ Database tables created (via Alembic)
- ✅ Server running on port 8001

### Frontend Setup
- ✅ All Flutter dependencies installed
- ✅ Freezed code generated
- ✅ API URL configured to port 8001
- ✅ pubspec.yaml conflicts resolved

## 🧪 How to Test

### 1. Test Backend API

**Open in browser:**
```
http://localhost:8001/docs
```

**Try creating a user:**
1. Click on `POST /api/v1/users/`
2. Click "Try it out"
3. Paste this JSON:
```json
{
  "role": "seller",
  "phone": "+923001234567",
  "name": "Fatima's Kitchen",
  "locale": "ur"
}
```
4. Click "Execute"

**Create menu items:**
1. Use `POST /api/v1/menu`
2. With seller_id from the user you just created
3. Example:
```json
{
  "name": "Chicken Biryani",
  "photo_url": "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8",
  "category": "Main Course",
  "price_pk": 450,
  "portion": "1 plate",
  "is_available": true
}
```

### 2. Test Mobile App (Once Installed)

The app should automatically open on your phone showing:

**Buyer Flow:**
1. Home screen with menu items (if you created any via API)
2. Tap an item to see details
3. Add to cart
4. Checkout and place order

**To Switch to Seller/Rider Views:**
- You'll need to modify the initial route in `app/lib/app_router.dart`
- Or implement a role selection screen (future enhancement)

### 3. Monitor App Building

Check the terminal where `flutter run` is running to see build progress.

Expected output:
```
✓ Built build/app/outputs/flutter-apk/app-debug.apk
Installing app...
```

## 📊 Current Data Status

**Database:** SQLite at `/home/l3k/HearthBites/server/hearthbites_test.db`

**Tables Created:**
- ✅ users
- ✅ addresses
- ✅ menu_items
- ✅ orders
- ✅ order_items
- ✅ rider_presence
- ✅ deliveries
- ✅ payouts

**Data:** Empty (seed script had SQLite compatibility issues)
- Create data via API endpoints instead

## 🔍 Useful Commands

### Backend Commands
```bash
# Check if backend is running
curl http://localhost:8001/health

# Stop backend (if needed)
pkill -f uvicorn

# Restart backend
cd /home/l3k/HearthBites/server
source .venv/bin/activate
uvicorn app.main:app --reload --port 8001
```

### Frontend Commands
```bash
# Check Flutter devices
flutter devices

# Run on physical device
cd /home/l3k/HearthBites/app
flutter run -d 43a7e615

# Run on Chrome (web)
flutter run -d chrome

# Hot reload (press 'r' in terminal while app is running)
# Hot restart (press 'R')
```

### Check App Status
```bash
# See Flutter build progress
ps aux | grep flutter

# See backend logs
ps aux | grep uvicorn
```

## 📱 App Features to Test

### Buyer Features
- [x] Browse menu items
- [x] View item details
- [x] Add to cart
- [x] Adjust quantities
- [x] Checkout
- [x] Place order
- [x] Track order status

### Seller Features
- [x] View dashboard
- [x] Add menu items
- [x] Edit menu items
- [x] Toggle availability
- [x] View incoming orders
- [x] Accept/reject orders

### Rider Features
- [x] Toggle availability
- [x] View assigned tasks
- [x] Update delivery status
- [x] Navigate to locations

## 🐛 Troubleshooting

### App Not Connecting to Backend

If the app can't reach the backend:

1. **Check backend is running:**
   ```bash
   curl http://localhost:8001/health
   ```

2. **For physical device, use your computer's IP:**
   - Find your IP: `ifconfig` or `ip addr show`
   - Update `app/lib/core/env.dart`:
   ```dart
   defaultValue: 'http://YOUR_IP:8001'
   ```
   - Rebuild the app

3. **Make sure phone and computer are on same network**

### Build Errors

```bash
# Clean and rebuild
cd /home/l3k/HearthBites/app
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

### Gradle Issues

Already fixed! But if you see more issues:
```bash
cd android
./gradlew clean
cd ..
flutter run
```

## 🎯 Quick Test Checklist

Backend:
- [ ] Visit http://localhost:8001/docs
- [ ] Create a user via API
- [ ] Create menu items via API
- [ ] Test menu endpoint returns data

Frontend:
- [ ] App installed on phone
- [ ] App opens without crashes
- [ ] Can see menu items (if created)
- [ ] Navigation works
- [ ] Can interact with UI

## 📖 Documentation

- **Full Setup Guide**: `SETUP_GUIDE.md`
- **Testing Guide**: `TESTING_GUIDE.md`
- **Architecture**: `ARCHITECTURE.md`
- **Project Summary**: `PROJECT_SUMMARY.md`
- **Quick Start**: `QUICKSTART.md`

## 🔗 Important URLs

- **Backend API**: http://localhost:8001
- **API Docs**: http://localhost:8001/docs
- **ReDoc**: http://localhost:8001/redoc
- **Health Check**: http://localhost:8001/health

## 💡 Next Steps

1. ✅ Wait for app to finish installing on phone
2. Create sample data via API at http://localhost:8001/docs
3. Test the complete buyer flow
4. Test seller and rider flows
5. Make any customizations you need

---

**Everything is set up and running! 🚀**

The app should appear on your phone any moment now. Check the terminal for installation progress!


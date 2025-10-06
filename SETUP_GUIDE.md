# HearthBites - Complete Setup Guide

This guide will walk you through setting up the entire HearthBites project from scratch.

## 📋 Prerequisites Checklist

Before you begin, ensure you have:

### Backend Requirements
- [ ] Python 3.11 or higher
- [ ] PostgreSQL 14+ (or Supabase account)
- [ ] pip package manager
- [ ] Git

### Frontend Requirements
- [ ] Flutter SDK 3.22+
- [ ] Android Studio (for Android development)
- [ ] Xcode (for iOS development on Mac)
- [ ] A code editor (VS Code recommended)

### Verification Commands

```bash
# Verify Python
python --version  # Should show 3.11+

# Verify PostgreSQL
psql --version

# Verify Flutter
flutter doctor

# Verify Git
git --version
```

## 🚀 Step-by-Step Setup

### Part 1: Backend Setup (15-20 minutes)

#### 1.1 Navigate to Server Directory

```bash
cd HearthBites/server
```

#### 1.2 Create Virtual Environment

```bash
# Create virtual environment
python -m venv .venv

# Activate it
# On Linux/Mac:
source .venv/bin/activate

# On Windows:
.venv\Scripts\activate
```

You should see `(.venv)` in your terminal prompt.

#### 1.3 Install Dependencies

```bash
pip install -e .
pip install -e ".[dev]"  # Include development tools
```

This will install:
- FastAPI
- SQLAlchemy
- Alembic
- Pydantic
- PostgreSQL driver
- Testing tools

#### 1.4 Setup Database

**Option A: Local PostgreSQL**

```bash
# Create database
createdb hearthbites

# Or using psql:
psql -U postgres
CREATE DATABASE hearthbites;
\q
```

**Option B: Supabase (Recommended for MVP)**

1. Go to https://supabase.com
2. Create a new project
3. Wait for the database to be provisioned
4. Copy the connection string from Project Settings → Database

#### 1.5 Configure Environment

Create `.env` file in `server/` directory:

```bash
# For local PostgreSQL
DATABASE_URL=postgresql://postgres:your_password@localhost:5432/hearthbites

# For Supabase
DATABASE_URL=postgresql://postgres:[YOUR-PASSWORD]@db.[YOUR-PROJECT-REF].supabase.co:5432/postgres

# Optional Supabase settings
SUPABASE_URL=https://[YOUR-PROJECT-REF].supabase.co
SUPABASE_ANON_KEY=[YOUR-ANON-KEY]
SUPABASE_JWT_SECRET=[YOUR-JWT-SECRET]

# Optional
FCM_SERVER_KEY=
MAPS_PROVIDER=osm
```

#### 1.6 Run Migrations

```bash
# Generate initial migration
alembic revision --autogenerate -m "Initial schema"

# Apply migrations
alembic upgrade head
```

You should see: `Running upgrade -> [revision], Initial schema`

#### 1.7 Seed Sample Data

```bash
python -m scripts.seed_data
```

Expected output:
```
🌱 Seeding database...
Creating users...
Creating addresses...
Creating menu items...
Creating sample orders...
✅ Database seeded successfully!
```

#### 1.8 Start Backend Server

```bash
uvicorn app.main:app --reload --port 8000
```

Expected output:
```
INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
INFO:     Started reloader process
```

#### 1.9 Verify Backend

Open browser and go to: http://localhost:8000/docs

You should see the Swagger UI with all API endpoints.

Test the health endpoint:
```bash
curl http://localhost:8000/health
# Should return: {"status":"healthy"}
```

### Part 2: Frontend Setup (10-15 minutes)

Open a **new terminal** (keep the backend running).

#### 2.1 Navigate to App Directory

```bash
cd HearthBites/app
```

#### 2.2 Install Flutter Dependencies

```bash
flutter pub get
```

This will download all packages listed in `pubspec.yaml`.

#### 2.3 Generate Code

Since we use Freezed for models, we need to generate code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This creates `.freezed.dart` and `.g.dart` files.

#### 2.4 Configure API Endpoint

Edit `lib/core/env.dart` if needed:

```dart
// For Android emulator (default)
static const String apiBaseUrl = 'http://10.0.2.2:8000';

// For iOS simulator
static const String apiBaseUrl = 'http://localhost:8000';

// For physical device (replace with your computer's IP)
static const String apiBaseUrl = 'http://192.168.1.XXX:8000';
```

To find your computer's IP:
```bash
# On Linux/Mac
ifconfig | grep inet

# On Windows
ipconfig
```

#### 2.5 Run the App

**Option A: Android Emulator**

```bash
# List available devices
flutter devices

# Run on Android emulator
flutter run
```

**Option B: Chrome (for quick testing)**

```bash
flutter run -d chrome
```

**Option C: Physical Device**

1. Enable USB debugging on your Android device
2. Connect via USB
3. Run: `flutter run`

#### 2.6 Verify App is Working

1. App should launch and show the buyer home screen
2. You should see menu items (Chicken Biryani, etc.)
3. Try adding an item to cart
4. Navigate through the app

## 🧪 Testing the Complete Flow

### Buyer Flow Test

1. **Browse Menu**
   - Open app → See menu items
   - Tap on "Chicken Biryani"

2. **Add to Cart**
   - Adjust quantity
   - Click "Add to Cart"
   - Tap cart icon (should show badge)

3. **Checkout**
   - Review cart items
   - Click "Proceed to Checkout"
   - Select Delivery/Pickup
   - Select Cash payment
   - Click "Place Order"

4. **Track Order**
   - Should navigate to order status screen
   - See order timeline

### Seller Flow Test

1. Change route in browser/code to `/seller/dashboard`
2. See menu items with toggle switches
3. Try adding a new menu item via FAB
4. Navigate to orders inbox
5. Accept/reject orders

### Rider Flow Test

1. Change route to `/rider/tasks`
2. Toggle availability switch
3. View assigned tasks
4. Open task details
5. Update delivery status

## 🐛 Common Issues & Solutions

### Backend Issues

**Issue: `ModuleNotFoundError: No module named 'app'`**

Solution:
```bash
# Make sure you're in the server directory
cd server
# Reinstall in editable mode
pip install -e .
```

**Issue: `sqlalchemy.exc.OperationalError: could not connect to server`**

Solution:
- Check PostgreSQL is running: `sudo service postgresql status`
- Verify DATABASE_URL in `.env`
- For Supabase: Check project is active

**Issue: `alembic.util.exc.CommandError: Can't locate revision identified by`**

Solution:
```bash
# Reset alembic
rm -rf alembic/versions/*
alembic revision --autogenerate -m "Initial schema"
alembic upgrade head
```

### Frontend Issues

**Issue: `Error: Cannot run with sound null safety because dependencies don't support it`**

Solution:
```bash
flutter pub upgrade --major-versions
```

**Issue: `The getter 'copyWith' isn't defined for the type`**

Solution:
```bash
# Regenerate freezed files
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

**Issue: `Failed to connect to /10.0.2.2:8000`**

Solution:
- Ensure backend is running: Check http://localhost:8000/health
- For Android emulator: Use `10.0.2.2`
- For iOS simulator: Use `localhost`
- For physical device: Use computer's local IP

**Issue: Freezed files not generating**

Solution:
```bash
# Add build_runner to dev dependencies
flutter pub add build_runner --dev
flutter pub add freezed --dev
flutter pub add json_serializable --dev

# Then generate
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📱 Running on Physical Device

### Android

1. Enable Developer Options on your device
2. Enable USB Debugging
3. Connect device via USB
4. Run: `adb devices` (should list your device)
5. Update `lib/core/env.dart` with your computer's IP
6. Run: `flutter run`

### iOS

1. Connect iPhone/iPad
2. Trust the computer on device
3. Open Xcode → Preferences → Accounts → Add Apple ID
4. Run: `flutter run`

## 🎯 Next Steps

After successful setup:

1. **Explore the API**
   - Visit http://localhost:8000/docs
   - Try different endpoints
   - Check the sample data

2. **Customize the App**
   - Change theme colors in `lib/core/theme.dart`
   - Add more menu items
   - Modify user flows

3. **Add Features**
   - Implement real authentication
   - Add image upload
   - Integrate payment gateway
   - Add push notifications

4. **Deploy**
   - Backend: Deploy to Heroku, Railway, or DigitalOcean
   - Database: Use Supabase or managed PostgreSQL
   - Frontend: Build APK and distribute

## 📚 Additional Resources

- **FastAPI Docs**: https://fastapi.tiangolo.com/
- **Flutter Docs**: https://flutter.dev/docs
- **Riverpod Docs**: https://riverpod.dev/
- **Supabase Docs**: https://supabase.com/docs
- **Alembic Docs**: https://alembic.sqlalchemy.org/

## 💡 Tips for Development

1. **Keep backend running** in one terminal
2. **Use hot reload** in Flutter for instant changes
3. **Check backend logs** for API errors
4. **Use Flutter DevTools** for debugging
5. **Test on real device** for accurate performance

## 🎉 You're All Set!

If you've followed this guide, you should now have:
- ✅ Backend running on http://localhost:8000
- ✅ Frontend running on emulator/device
- ✅ Sample data loaded
- ✅ All features working

Happy coding! 🚀


# HearthBites - Quick Test Status

## ✅ Backend is RUNNING!

Your FastAPI backend is now live and ready to test!

### 🌐 Access Points

- **API Root**: http://localhost:8001/
- **API Documentation (Swagger)**: http://localhost:8001/docs
- **ReDoc**: http://localhost:8001/redoc
- **Health Check**: http://localhost:8001/health

### 📊 What's Set Up

✅ Backend server running on port **8001**  
✅ SQLite database created  
✅ All tables migrated  
✅ Virtual environment activated  
✅ All dependencies installed  

### 🧪 Quick Tests You Can Do Now

#### 1. Test via Browser
Open: **http://localhost:8001/docs**

This will show the interactive Swagger UI where you can:
- See all API endpoints
- Try them out directly in the browser
- See request/response examples

#### 2. Test via Command Line

```bash
# Test health endpoint
curl http://localhost:8001/health

# Get API status
curl http://localhost:8001/

# List menu items (will be empty for now)
curl http://localhost:8001/api/v1/menu
```

#### 3. Create Your First User

Go to http://localhost:8001/docs and:
1. Find `POST /api/v1/users/`
2. Click "Try it out"
3. Use this JSON:
```json
{
  "role": "buyer",
  "phone": "+923001111111",
  "name": "Test User",
  "locale": "en"
}
```
4. Click "Execute"

### 📱 Testing the Frontend (Next Step)

To test the Flutter app:

```bash
# Open a NEW terminal
cd /home/l3k/HearthBites/app

# First, update the API URL to port 8001
# Edit lib/core/env.dart and change:
# apiBaseUrl = 'http://10.0.2.2:8001'  (for Android emulator)
# or
# apiBaseUrl = 'http://localhost:8001'  (for web/iOS)

# Then run:
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

### ⚠️ Important Notes

1. **Port Change**: Backend is on **8001** (not 8000) because 8000 was in use
2. **Database**: Using SQLite (not PostgreSQL) for quick testing
3. **Seed Data**: Not loaded yet due to SQLite compatibility - create data via API
4. **Server Status**: Running in background - will auto-reload on code changes

### 🛑 Stop the Server

```bash
# Find the process
ps aux | grep uvicorn

# Kill it
kill <PID>

# Or use:
pkill -f uvicorn
```

### 🚀 Next Steps

1. ✅ Test backend endpoints at http://localhost:8001/docs
2. Create sample users via API
3. Create menu items
4. Test the complete order flow
5. Set up Flutter app to connect to port 8001
6. Run the mobile app

### 📖 Full Testing Guide

For comprehensive testing instructions, see: **TESTING_GUIDE.md**

---

**Status**: Backend is READY for testing! 🎉
**Access**: http://localhost:8001/docs



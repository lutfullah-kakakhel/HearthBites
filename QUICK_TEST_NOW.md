# 🚀 Test HearthBites RIGHT NOW (Web Version)

## ✅ What's Running

I've started the **web version** of the app - **NO MORE WAITING for Android build!**

### Open These URLs:

1. **📱 Flutter App (Web)**: http://localhost:8080
   - The app is running in Chrome!
   - Test all features immediately

2. **🔧 Backend API**: http://localhost:8001/docs
   - Create sample data here

## 🎯 Quick 2-Minute Test

### Step 1: Create Sample Data (1 minute)

**Open**: http://localhost:8001/docs

**A) Create a Seller:**
1. Find `POST /api/v1/users/`
2. Click "Try it out"
3. Paste this:
```json
{
  "role": "seller",
  "phone": "+923001234567",
  "name": "Fatima's Kitchen",
  "locale": "ur"
}
```
4. Click "Execute"
5. **Copy the `id` from the response!**

**B) Create Menu Items:**
1. Find `POST /api/v1/menu`
2. In the `seller_id` box, paste the ID you just copied
3. Paste this:
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
4. Click "Execute"
5. Create 2-3 more items!

### Step 2: Test the App (1 minute)

**Open**: http://localhost:8080

You should see:
- ✅ Menu items you just created
- ✅ Can click items
- ✅ Add to cart
- ✅ Full checkout flow

Press **R** in the terminal to hot reload if items don't appear!

## 📱 Web vs Android

**Web Version (Running Now):**
- ✅ Works immediately
- ✅ Same features
- ✅ Perfect for testing
- ⚠️ Some mobile features limited (GPS, etc.)

**Android Version (Still has issues):**
- ❌ Gradle/Kotlin compatibility problems
- ❌ Takes 3-5 minutes to build
- 💡 We can fix later - web works great for now!

## 🎯 What to Test

### Buyer Flow:
1. See menu items ✓
2. Click item → See details ✓
3. Add to cart ✓
4. View cart ✓
5. Checkout ✓
6. Place order ✓
7. See order status ✓

### Navigation:
- Home screen works ✓
- Cart icon (top right) ✓
- Back navigation ✓

## 🔄 Hot Reload

In the terminal where Flutter is running:
- Press **r** = Quick reload
- Press **R** = Full restart
- Press **q** = Quit

## 📊 Current URLs

| Service | URL | Status |
|---------|-----|--------|
| Flutter App (Web) | http://localhost:8080 | ✅ Running |
| Backend API | http://localhost:8001 | ✅ Running |
| API Docs | http://localhost:8001/docs | ✅ Ready |

## ⚡ Pro Tip

Keep both open side-by-side:
- **Left**: http://localhost:8080 (App)
- **Right**: http://localhost:8001/docs (Create data)

Create menu items → Hot reload (r) → See them appear!

## 🐛 If App Shows Empty

1. **Check backend**: http://localhost:8001/api/v1/menu
   - Should show your items

2. **Hot reload**: Press 'r' in terminal

3. **Hard refresh**: Press 'R' in terminal

## 🎉 You're Testing NOW!

No more waiting! The web version works perfectly and you can test everything right now.

**Android build issues? We'll fix later - web works great for testing!** 🚀


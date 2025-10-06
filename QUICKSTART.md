# HearthBites - Quick Start (5 Minutes)

Get the app running in 5 minutes with minimal setup.

## Prerequisites

- Python 3.11+
- Flutter 3.22+
- PostgreSQL or Supabase account

## Backend Setup (2 minutes)

```bash
# 1. Navigate and setup
cd server
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -e .

# 2. Create .env file
cat > .env << EOF
DATABASE_URL=postgresql://postgres:password@localhost:5432/hearthbites
EOF

# 3. Setup database
createdb hearthbites  # Or use Supabase URL in .env
alembic upgrade head
python -m scripts.seed_data

# 4. Run server
uvicorn app.main:app --reload
```

Server running at: http://localhost:8000

## Frontend Setup (3 minutes)

```bash
# 1. Navigate and install
cd ../app
flutter pub get

# 2. Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Run app
flutter run  # Or flutter run -d chrome
```

## Test It Works

1. **Backend**: Visit http://localhost:8000/docs
2. **Frontend**: You should see menu items (Chicken Biryani, etc.)
3. **Test flow**: Add item to cart → Checkout → Place order

## Troubleshooting

**Backend won't start?**
```bash
# Check Python version
python --version  # Should be 3.11+
# Check database
psql -U postgres -d hearthbites -c "SELECT 1"
```

**Frontend won't connect?**
- Android emulator: Edit `lib/core/env.dart` → Use `http://10.0.2.2:8000`
- iOS simulator: Use `http://localhost:8000`
- Physical device: Use your computer's IP address

**Freezed errors?**
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## What's Next?

1. Read `SETUP_GUIDE.md` for detailed instructions
2. Read `PROJECT_SUMMARY.md` to understand the codebase
3. Explore the API at http://localhost:8000/docs
4. Check the READMEs in `server/` and `app/` folders

## Default Test Accounts

The seed script creates:
- **Seller 1**: Fatima's Kitchen (+923001234567)
- **Seller 2**: Zainab's Delights (+923001234568)
- **Buyer 1**: Ahmed Ali (+923009876543)
- **Buyer 2**: Sara Khan (+923009876544)
- **Rider**: Bilal Hussain (+923005555555)

## Quick Commands Reference

```bash
# Backend
cd server
uvicorn app.main:app --reload              # Start server
alembic upgrade head                       # Run migrations
python -m scripts.seed_data                # Seed data
pytest                                     # Run tests

# Frontend
cd app
flutter run                                # Run app
flutter analyze                            # Check code
flutter pub run build_runner build         # Generate code
flutter build apk                          # Build APK
```

---

**Need help?** Check the full `SETUP_GUIDE.md` or `README.md`


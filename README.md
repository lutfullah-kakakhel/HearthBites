# HearthBites 🍽️

A hyper-local home-food marketplace with rider delivery system. Connect home chefs with local customers and enable seamless delivery through an efficient rider network.

## 🏗️ Architecture

This is a **monorepo** containing:

- **`app/`** - Flutter mobile application (Android-first)
- **`server/`** - FastAPI backend with PostgreSQL/Supabase

## 🎯 Features

### Buyer
- Browse nearby sellers' menus
- Add items to cart and checkout
- Choose pickup or delivery
- Track order status in real-time
- Cash on delivery payment

### Seller (Home Chef)
- Manage menu items with photos
- Accept/reject incoming orders
- Auto-assign riders for delivery
- Track order fulfillment

### Rider
- Toggle availability status
- View assigned delivery tasks
- Navigate to pickup/drop locations
- Update delivery status
- Earn delivery fees

### Tech Stack

**Frontend:**
- Flutter 3.22+
- Riverpod (state management)
- GoRouter (navigation)
- Freezed (immutable models)
- Dio (HTTP client)

**Backend:**
- FastAPI
- PostgreSQL via Supabase
- SQLAlchemy 2.x
- Pydantic v2
- Alembic (migrations)

**Infrastructure:**
- Supabase (Auth, DB, Storage)
- Firebase Cloud Messaging (push notifications)
- OpenStreetMap/Google Maps

## 📋 Prerequisites

### Backend
- Python 3.11+
- PostgreSQL (or Supabase account)
- pip

### Frontend
- Flutter SDK 3.22+
- Android Studio / Xcode
- Android SDK / iOS development tools

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd HearthBites
```

### 2. Setup Backend

```bash
cd server
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -e .
```

Create a `.env` file in `server/` directory:

```env
DATABASE_URL=postgresql://postgres:password@localhost:5432/hearthbites
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
SUPABASE_JWT_SECRET=your-jwt-secret
```

Run migrations and seed data:

```bash
alembic upgrade head
python -m scripts.seed_data
```

Start the server:

```bash
uvicorn app.main:app --reload --port 8000
```

### 3. Setup Frontend

```bash
cd app
flutter pub get
```

Create environment configuration (optional, uses defaults):

```bash
# For Android emulator (default)
export API_BASE_URL=http://10.0.2.2:8000

# For iOS simulator
export API_BASE_URL=http://localhost:8000

# For physical device
export API_BASE_URL=http://YOUR_COMPUTER_IP:8000
```

Run the app:

```bash
flutter run
```

## 📁 Project Structure

```
HearthBites/
├── app/                      # Flutter frontend
│   ├── lib/
│   │   ├── core/            # Theme, i18n, env
│   │   ├── data/            # Models, services
│   │   ├── features/        # UI screens (buyer, seller, rider)
│   │   ├── providers/       # Riverpod state management
│   │   ├── app_router.dart  # Navigation
│   │   └── main.dart
│   └── pubspec.yaml
│
├── server/                   # FastAPI backend
│   ├── app/
│   │   ├── api/             # REST endpoints
│   │   ├── core/            # Config, security
│   │   ├── db/              # Database session
│   │   ├── models/          # SQLAlchemy models
│   │   ├── schemas/         # Pydantic schemas
│   │   ├── services/        # Business logic
│   │   └── main.py
│   ├── alembic/             # Migrations
│   ├── scripts/             # Seed data
│   ├── tests/               # Unit tests
│   └── pyproject.toml
│
└── README.md
```

## 🌐 Internationalization (i18n)

The app supports:
- **English** (en)
- **Urdu** (ur) with RTL support

Default locale: Urdu for PK users.

To switch language, use the profile screen settings.

## 🧪 Testing

### Backend Tests

```bash
cd server
pytest -v
pytest --cov=app tests/  # With coverage
```

### Frontend Tests

```bash
cd app
flutter analyze
flutter test
```

## 🔑 Environment Variables

### Backend (`server/.env`)

| Variable | Description | Required |
|----------|-------------|----------|
| `DATABASE_URL` | PostgreSQL connection string | Yes |
| `SUPABASE_URL` | Supabase project URL | No (for dev) |
| `SUPABASE_JWT_SECRET` | JWT verification secret | No (for dev) |
| `FCM_SERVER_KEY` | Firebase messaging key | No (stub) |
| `MAPS_PROVIDER` | Map provider (osm/google) | No |

### Frontend (`app/lib/core/env.dart`)

| Variable | Description | Default |
|----------|-------------|---------|
| `API_BASE_URL` | Backend API URL | `http://10.0.2.2:8000` |
| `SUPABASE_URL` | Supabase project URL | - |
| `SUPABASE_ANON_KEY` | Supabase anon key | - |

## 📱 API Documentation

Once the server is running, visit:

- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

## 🔐 Authentication

For MVP, authentication is simplified:
- User IDs are passed as query parameters
- JWT validation can be bypassed in dev mode (no `SUPABASE_JWT_SECRET`)

For production, integrate Supabase Auth client-side and validate JWTs server-side.

## 🚴 Rider Assignment Algorithm

The system uses a **distance-based auto-assignment**:

1. When seller accepts an order with delivery
2. System finds available riders sorted by distance (haversine)
3. Nearest rider is assigned automatically
4. If no riders available, order status → `rider_requested`
5. Seller can manually assign from available rider list

## 🛣️ Roadmap (Post-MVP)

- [ ] Live GPS tracking
- [ ] In-app wallet & payment gateway integration
- [ ] Rating & review system
- [ ] Favorites & repeat orders
- [ ] Admin web dashboard
- [ ] Email/SMS notifications
- [ ] Order scheduling
- [ ] Multi-language expansion

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

## 📄 License

This project is licensed under the MIT License.

## 💬 Support

For issues or questions, please open an issue on GitHub.

---

**Built with ❤️ for local communities**


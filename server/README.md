# HearthBites Backend

FastAPI backend for the HearthBites home-food marketplace.

## 🚀 Setup

### 1. Create Virtual Environment

```bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
```

### 2. Install Dependencies

```bash
pip install -e .
pip install -e ".[dev]"  # Include dev dependencies
```

### 3. Configure Environment

Create `.env` file:

```env
DATABASE_URL=postgresql://postgres:password@localhost:5432/hearthbites
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
SUPABASE_JWT_SECRET=your-jwt-secret
FCM_SERVER_KEY=your-fcm-key
MAPS_PROVIDER=osm
```

### 4. Run Migrations

```bash
# Create initial migration
alembic revision --autogenerate -m "Initial schema"

# Apply migrations
alembic upgrade head
```

### 5. Seed Database

```bash
python -m scripts.seed_data
```

This creates:
- 2 sellers
- 2 buyers
- 1 rider
- 6 menu items
- 3 sample orders

### 6. Start Server

```bash
uvicorn app.main:app --reload --port 8000
```

API will be available at: http://localhost:8000

## 📚 API Documentation

- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

## 🏗️ Architecture

```
server/
├── app/
│   ├── api/
│   │   ├── deps.py                 # Dependencies
│   │   └── v1/
│   │       ├── routes_users.py     # User management
│   │       ├── routes_menu.py      # Menu CRUD
│   │       ├── routes_orders.py    # Order lifecycle
│   │       ├── routes_riders.py    # Rider presence
│   │       └── routes_deliveries.py # Delivery updates
│   ├── core/
│   │   ├── config.py               # Settings
│   │   └── security.py             # JWT validation
│   ├── db/
│   │   ├── base.py                 # SQLAlchemy base
│   │   └── session.py              # DB session
│   ├── models/                     # SQLAlchemy models
│   ├── schemas/                    # Pydantic schemas
│   ├── services/
│   │   ├── assignment.py           # Rider assignment logic
│   │   ├── notifications.py        # FCM stub
│   │   └── maps.py                 # Distance calculation
│   └── main.py                     # FastAPI app
├── alembic/                        # Migrations
├── scripts/
│   └── seed_data.py                # Sample data
├── tests/
│   └── test_assignment.py          # Unit tests
└── pyproject.toml
```

## 🔑 Key Endpoints

### Users
- `POST /api/v1/users/` - Create user
- `GET /api/v1/users/{user_id}` - Get user

### Menu
- `GET /api/v1/menu` - List menu items
- `POST /api/v1/menu` - Create menu item
- `PATCH /api/v1/menu/{id}` - Update menu item
- `DELETE /api/v1/menu/{id}` - Delete menu item

### Orders
- `POST /api/v1/orders` - Create order
- `GET /api/v1/orders/{id}` - Get order
- `GET /api/v1/orders` - List orders (filtered)
- `POST /api/v1/orders/{id}/accept` - Accept order (seller)
- `POST /api/v1/orders/{id}/reject` - Reject order (seller)
- `POST /api/v1/orders/{id}/request-rider` - Auto-assign rider
- `POST /api/v1/orders/{id}/assign-rider` - Manual assign

### Riders
- `POST /api/v1/rider/presence` - Update availability/heartbeat
- `GET /api/v1/rider/tasks` - Get assigned tasks
- `GET /api/v1/rider/available` - List available riders

### Deliveries
- `GET /api/v1/deliveries/{id}` - Get delivery
- `POST /api/v1/deliveries/{id}/status` - Update status

## 🧪 Testing

Run all tests:

```bash
pytest -v
```

Run with coverage:

```bash
pytest --cov=app --cov-report=html
```

Test specific module:

```bash
pytest tests/test_assignment.py -v
```

## 🗄️ Database Schema

### Core Tables

- **users** - All users (buyers, sellers, riders, admin)
- **addresses** - Delivery addresses
- **menu_items** - Seller menu catalog
- **orders** - Order records
- **order_items** - Line items in orders
- **rider_presence** - Rider availability & location
- **deliveries** - Delivery task records
- **payouts** - Payment records (placeholder)

### Indexes

- `idx_users_role` on `users(role)`
- `idx_menu_items_seller` on `menu_items(seller_id, is_available)`
- `idx_orders_seller_status` on `orders(seller_id, status)`
- `idx_orders_buyer_status` on `orders(buyer_id, status)`
- `idx_deliveries_rider_status` on `deliveries(rider_id, status)`
- `idx_rider_presence` on `rider_presence(is_available, last_seen_at)`

## 🔧 Development

### Create New Migration

```bash
alembic revision --autogenerate -m "Description"
```

### Rollback Migration

```bash
alembic downgrade -1
```

### Code Formatting

```bash
black app/ tests/
ruff check app/ tests/ --fix
```

## 📊 Services

### Assignment Service

Auto-assigns riders based on:
1. Availability (`is_available = true`)
2. Distance from pickup (haversine formula)
3. Last seen timestamp (tiebreaker)

Key methods:
- `find_nearest_available_rider()` - Find closest rider
- `auto_assign_rider()` - Assign automatically
- `manual_assign_rider()` - Manual assignment

### Notifications Service

Stub for FCM push notifications:
- `send_order_notification()` - Generic notification
- `send_rider_assignment()` - Rider task notification
- `send_status_update()` - Order status change

Logs to console in dev mode.

### Maps Service

Distance utilities:
- `haversine_distance()` - Calculate km between coords
- `distance_km()` - Alias
- `get_navigation_url()` - Generate Google Maps URL

## 🔐 Security

For development without Supabase:
- JWT verification is disabled if `SUPABASE_JWT_SECRET` is not set
- Tokens are decoded but not verified

For production:
- Set `SUPABASE_JWT_SECRET`
- Implement proper role-based access control
- Add rate limiting
- Enable CORS whitelist

## 📝 Logging

Configure in `app/main.py`:

```python
import logging
logging.basicConfig(level=logging.INFO)
```

## 🐳 Docker (Optional)

```dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY pyproject.toml .
RUN pip install -e .
COPY . .
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

## 📦 Dependencies

- **fastapi** - Web framework
- **uvicorn** - ASGI server
- **sqlalchemy** - ORM
- **alembic** - Migrations
- **pydantic** - Data validation
- **psycopg2-binary** - PostgreSQL driver
- **python-jose** - JWT handling

## 🤝 Contributing

1. Create feature branch
2. Write tests for new features
3. Run linter: `ruff check app/`
4. Run tests: `pytest`
5. Submit PR

---

**Happy Coding! 🚀**


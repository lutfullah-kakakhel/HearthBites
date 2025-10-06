from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api.v1 import routes_users, routes_menu, routes_orders, routes_riders, routes_deliveries
from app.core.config import settings

app = FastAPI(
    title=settings.app_name,
    description="HearthBites API - Home Food Marketplace with Rider Delivery",
    version="0.1.0"
)

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, specify exact origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(routes_users.router, prefix="/api/v1")
app.include_router(routes_menu.router, prefix="/api/v1")
app.include_router(routes_orders.router, prefix="/api/v1")
app.include_router(routes_riders.router, prefix="/api/v1")
app.include_router(routes_deliveries.router, prefix="/api/v1")


@app.get("/")
def root():
    """Root endpoint."""
    return {
        "app": settings.app_name,
        "version": "0.1.0",
        "status": "running"
    }


@app.get("/health")
def health_check():
    """Health check endpoint."""
    return {"status": "healthy"}


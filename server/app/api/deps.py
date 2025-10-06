from typing import Generator
from fastapi import Depends
from sqlalchemy.orm import Session
from app.db.session import get_db
from app.core.security import get_current_user_id


def get_db_session() -> Generator:
    """Get database session dependency."""
    return get_db()


async def get_current_user(
    user_id: str = Depends(get_current_user_id),
    db: Session = Depends(get_db_session)
) -> str:
    """Get current authenticated user ID."""
    return user_id


from typing import Optional
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from jose import JWTError, jwt
from app.core.config import settings

security = HTTPBearer()


def decode_token(token: str) -> dict:
    """Decode and verify Supabase JWT token."""
    try:
        # In dev mode without JWT secret, skip verification
        if not settings.supabase_jwt_secret:
            # For development: decode without verification
            payload = jwt.decode(token, options={"verify_signature": False})
            return payload
        
        # Production: verify with secret
        payload = jwt.decode(
            token,
            settings.supabase_jwt_secret,
            algorithms=["HS256"],
            options={"verify_aud": False}
        )
        return payload
    except JWTError as e:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=f"Invalid authentication credentials: {str(e)}",
        )


async def get_current_user_id(
    credentials: HTTPAuthorizationCredentials = Depends(security)
) -> str:
    """Extract user ID from JWT token."""
    payload = decode_token(credentials.credentials)
    user_id: Optional[str] = payload.get("sub")
    
    if user_id is None:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Could not validate credentials",
        )
    
    return user_id


def role_required(allowed_roles: list[str]):
    """Decorator to check if user has required role."""
    def decorator(func):
        async def wrapper(*args, **kwargs):
            # This would need to fetch user from DB in production
            # For MVP, we pass role checks to the route handlers
            return await func(*args, **kwargs)
        return wrapper
    return decorator


from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Application configuration."""
    
    model_config = SettingsConfigDict(env_file=".env", case_sensitive=False)
    
    # Database
    database_url: str = "postgresql://postgres:password@localhost:5432/hearthbites"
    
    # Supabase
    supabase_url: str = ""
    supabase_anon_key: str = ""
    supabase_jwt_secret: str = ""
    
    # Optional
    fcm_server_key: str = ""
    maps_provider: str = "osm"
    
    # App
    app_name: str = "HearthBites"
    debug: bool = True


settings = Settings()


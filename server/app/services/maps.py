import math
from typing import Tuple


def haversine_distance(
    lat1: float, lon1: float, lat2: float, lon2: float
) -> float:
    """
    Calculate the great circle distance between two points on earth (in km).
    Uses the Haversine formula.
    """
    # Convert decimal degrees to radians
    lat1, lon1, lat2, lon2 = map(math.radians, [lat1, lon1, lat2, lon2])
    
    # Haversine formula
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = math.sin(dlat/2)**2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon/2)**2
    c = 2 * math.asin(math.sqrt(a))
    
    # Radius of earth in kilometers
    r = 6371
    
    return c * r


def distance_km(a_lat: float, a_lng: float, b_lat: float, b_lng: float) -> float:
    """Calculate distance between two coordinates in kilometers."""
    return haversine_distance(a_lat, a_lng, b_lat, b_lng)


def get_navigation_url(dest_lat: float, dest_lng: float) -> str:
    """Generate navigation URL (Google Maps by default)."""
    return f"https://www.google.com/maps/dir/?api=1&destination={dest_lat},{dest_lng}"


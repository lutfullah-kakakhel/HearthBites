#!/usr/bin/env python3
import sqlite3
from uuid import uuid4
from datetime import datetime

# Connect to the correct database
conn = sqlite3.connect('hearthbites_test.db')
cursor = conn.cursor()

# Create buyer
buyer_id = str(uuid4())
cursor.execute("""
    INSERT INTO users (id, role, phone, name, avatar_url, rating_avg, locale, created_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
""", (buyer_id.replace('-', ''), 'buyer', '+923009876543', 'Test Buyer', None, 0.0, 'en', datetime.utcnow()))

# Create address for the buyer
address_id = str(uuid4())
cursor.execute("""
    INSERT INTO addresses (id, user_id, label, line1, area, city, lat, lng, is_default)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
""", (address_id.replace('-', ''), buyer_id.replace('-', ''), 'Home', '123 Main St', 'Model Town', 'Lahore', 31.5204, 74.3587, 1))

conn.commit()

print(f"✅ Buyer created: {buyer_id.replace('-', '')}")
print(f"✅ Address created: {address_id.replace('-', '')}")

# Verify
cursor.execute("SELECT * FROM users WHERE id = ?", (buyer_id.replace('-', ''),))
print("\nBuyer:", cursor.fetchone())

cursor.execute("SELECT * FROM addresses WHERE id = ?", (address_id.replace('-', ''),))
print("Address:", cursor.fetchone())

conn.close()


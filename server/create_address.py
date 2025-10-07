#!/usr/bin/env python3
import sqlite3

# Connect to database
conn = sqlite3.connect('hearthbites.db')
cursor = conn.cursor()

# Create address for the buyer
buyer_id = 'bec9a90c-a1ea-4128-a835-3b1851be03c2'
address_id = '550e8400-e29b-41d4-a716-446655440000'

cursor.execute("""
    INSERT INTO addresses (id, user_id, label, line1, area, city, lat, lng, is_default)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
""", (address_id, buyer_id, 'Home', '123 Main St', 'Model Town', 'Lahore', 31.5204, 74.3587, 1))

conn.commit()

# Verify
cursor.execute("SELECT * FROM addresses WHERE id = ?", (address_id,))
result = cursor.fetchone()
print("✅ Address created:", result)

conn.close()


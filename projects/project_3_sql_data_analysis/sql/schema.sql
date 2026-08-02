-- =====================================================================
-- schema.sql
-- Project 3: SQL Data Analysis | DecodeLabs Data Analytics Internship
-- =====================================================================
-- Table definition for the `orders` table, loaded from the verified,
-- cleaned dataset produced in Project 1 (Data Cleaning & Preparation).
-- The notebook builds this table automatically from
-- data/ecommerce_orders_cleaned.csv into database/ecommerce.db — this
-- file documents the resulting structure for reference.
-- =====================================================================

CREATE TABLE IF NOT EXISTS orders (
    OrderID          TEXT PRIMARY KEY,   -- Unique order identifier (ORD######)
    Date             TEXT,               -- Order date, ISO 8601 (YYYY-MM-DD)
    CustomerID       TEXT,               -- Customer identifier (C#####)
    Product          TEXT,               -- Product purchased
    Quantity         INTEGER,            -- Units ordered
    UnitPrice        REAL,               -- Price per unit (USD)
    ShippingAddress  TEXT,               -- Delivery street address
    PaymentMethod    TEXT,               -- Payment channel used
    OrderStatus      TEXT,               -- Order lifecycle status
    TrackingNumber   TEXT,               -- Shipment tracking ID (TRK########)
    ItemsInCart      INTEGER,            -- Total items in the customer's cart
    CouponCode       TEXT,               -- Coupon applied at checkout ('Nocoupon' if none)
    ReferralSource   TEXT,               -- Marketing channel that drove the order
    TotalPrice       REAL                -- Quantity x UnitPrice
);

-- Row count check
-- SELECT COUNT(*) FROM orders;   -- Expected: 1200

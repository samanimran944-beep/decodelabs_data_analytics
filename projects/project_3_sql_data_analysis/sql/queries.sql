-- =====================================================================
-- queries.sql
-- Project 3: SQL Data Analysis | DecodeLabs Data Analytics Internship
-- =====================================================================
-- All queries below are also executed live (with real results) in
-- notebook/SQL_Data_Analysis.ipynb. This file is the standalone,
-- reviewable query reference for the project.
--
-- Dialect: SQLite (functions like strftime() are SQLite-specific;
-- see README.md for standard-SQL equivalents on other engines).
-- =====================================================================


-- -----------------------------------------------------------------
-- 1. BASIC SELECT — Sanity check on row count and structure
-- -----------------------------------------------------------------
SELECT COUNT(*) AS total_orders
FROM orders;


-- -----------------------------------------------------------------
-- 2. WHERE — Filter high-value orders (basket value over $3,000)
-- -----------------------------------------------------------------
SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice
FROM orders
WHERE TotalPrice > 3000
ORDER BY TotalPrice DESC;


-- -----------------------------------------------------------------
-- 3. WHERE + Pattern Matching — Orders shipped to a specific street pattern
-- -----------------------------------------------------------------
SELECT OrderID, ShippingAddress, OrderStatus
FROM orders
WHERE ShippingAddress LIKE '9%'
ORDER BY OrderID
LIMIT 10;


-- -----------------------------------------------------------------
-- 4. GROUP BY + Aggregation — Revenue and order count per product
-- -----------------------------------------------------------------
SELECT
    Product,
    COUNT(*)            AS order_count,
    SUM(TotalPrice)      AS total_revenue,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM orders
GROUP BY Product
ORDER BY total_revenue DESC;


-- -----------------------------------------------------------------
-- 5. GROUP BY + Percentage Share — Order status distribution
-- -----------------------------------------------------------------
SELECT
    OrderStatus,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS pct_of_total
FROM orders
GROUP BY OrderStatus
ORDER BY order_count DESC;


-- -----------------------------------------------------------------
-- 6. GROUP BY — Average order value (AOV) by payment method
-- -----------------------------------------------------------------
SELECT
    PaymentMethod,
    COUNT(*)                  AS order_count,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM orders
GROUP BY PaymentMethod
ORDER BY avg_order_value DESC;


-- -----------------------------------------------------------------
-- 7. GROUP BY — Revenue and AOV by marketing/referral channel
-- -----------------------------------------------------------------
SELECT
    ReferralSource,
    COUNT(*)                   AS order_count,
    ROUND(SUM(TotalPrice), 2)  AS total_revenue,
    ROUND(AVG(TotalPrice), 2)  AS avg_order_value
FROM orders
GROUP BY ReferralSource
ORDER BY total_revenue DESC;


-- -----------------------------------------------------------------
-- 8. HAVING — Repeat customers (placed more than one order)
--    Demonstrates: HAVING filters AFTER aggregation (unlike WHERE,
--    which filters individual rows before grouping).
-- -----------------------------------------------------------------
SELECT
    CustomerID,
    COUNT(*)                  AS order_count,
    ROUND(SUM(TotalPrice), 2) AS total_spent
FROM orders
GROUP BY CustomerID
HAVING COUNT(*) > 1
ORDER BY total_spent DESC
LIMIT 10;


-- -----------------------------------------------------------------
-- 9. HAVING — Count of repeat customers overall
-- -----------------------------------------------------------------
SELECT COUNT(*) AS repeat_customer_count
FROM (
    SELECT CustomerID
    FROM orders
    GROUP BY CustomerID
    HAVING COUNT(*) > 1
);


-- -----------------------------------------------------------------
-- 10. Date functions + GROUP BY — Yearly revenue trend
--     (SQLite: strftime('%Y', Date); standard SQL: EXTRACT(YEAR FROM Date))
-- -----------------------------------------------------------------
SELECT
    strftime('%Y', Date)       AS year,
    COUNT(*)                   AS order_count,
    ROUND(SUM(TotalPrice), 2)  AS total_revenue
FROM orders
GROUP BY year
ORDER BY year;


-- -----------------------------------------------------------------
-- 11. Multi-condition WHERE + ORDER BY — At-risk high-value orders
--     (Cancelled or Returned AND above-average order value)
-- -----------------------------------------------------------------
SELECT OrderID, Product, OrderStatus, TotalPrice
FROM orders
WHERE OrderStatus IN ('Cancelled', 'Returned')
  AND TotalPrice > (SELECT AVG(TotalPrice) FROM orders)
ORDER BY TotalPrice DESC
LIMIT 10;


-- -----------------------------------------------------------------
-- 12. GROUP BY — Coupon code usage and its effect on order value
-- -----------------------------------------------------------------
SELECT
    CouponCode,
    COUNT(*)                  AS order_count,
    ROUND(AVG(TotalPrice), 2) AS avg_order_value
FROM orders
GROUP BY CouponCode
ORDER BY order_count DESC;

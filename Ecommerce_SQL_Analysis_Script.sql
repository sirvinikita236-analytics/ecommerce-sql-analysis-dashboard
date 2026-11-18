
-- =====================================================
-- E-COMMERCE SQL ANALYSIS
-- Database: ecommerce_analysis
-- Tool: MySQL
-- =====================================================


-- 1. DATABASE SETUP

CREATE DATABASE IF NOT EXISTS ecommerce_analysis;

USE ecommerce_analysis;


-- 2. DATA EXPLORATION

SELECT * FROM customers LIMIT 10;

SELECT * FROM orders LIMIT 10;

SELECT * FROM products LIMIT 10;

SELECT * FROM payments LIMIT 10;


-- 3. TABLE STRUCTURE

DESCRIBE customers;

DESCRIBE orders;

DESCRIBE order_items;

DESCRIBE products;

DESCRIBE payments;


-- 4. BASIC BUSINESS METRICS

-- Total customers

SELECT
    COUNT(customer_id) AS total_customers
FROM customers;


-- Total orders

SELECT
    COUNT(order_id) AS total_orders
FROM orders;


-- Total revenue collected through payments

SELECT
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM payments;


-- 5. AVERAGE ORDER VALUE

-- First calculate total payment for each order.
-- Then calculate the average of those order totals.

SELECT
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM (
    SELECT
        order_id,
        SUM(payment_value) AS order_total
    FROM payments
    GROUP BY order_id
) AS order_payments;


-- 6. TOP 10 PRODUCTS

-- Counts the number of order-item records
-- associated with each product.

SELECT
    product_id,
    COUNT(*) AS total_order_items
FROM order_items
GROUP BY product_id
ORDER BY total_order_items DESC
LIMIT 10;


-- 7. ORDER STATUS ANALYSIS

SELECT
    order_status,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- 8. MONTHLY ORDER TRENDS

SELECT
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY order_month;


-- 9. TOP 10 CUSTOMERS BY SPENDING

SELECT
    o.customer_id,
    ROUND(SUM(p.payment_value), 2) AS total_spent
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- 10. REVENUE BY PRODUCT CATEGORY

-- Uses item prices rather than joining payment totals
-- to every product row, avoiding duplicated payment amounts.
-- Freight charges are excluded from this calculation.

SELECT
    COALESCE(p.product_category_name, 'Unknown') AS product_category,
    ROUND(SUM(oi.price), 2) AS category_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    COALESCE(p.product_category_name, 'Unknown')
ORDER BY category_revenue DESC;


-- 11. ADDITIONAL DATA COUNTS

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_order_items
FROM order_items;

SELECT COUNT(*) AS total_payment_records
FROM payments;


-- 12. CUSTOMERS WITH MOST ORDERS

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;


-- 13. PAYMENT METHOD DISTRIBUTION

SELECT
    payment_type,
    COUNT(*) AS total_transactions
FROM payments
GROUP BY payment_type
ORDER BY total_transactions DESC;


-- =====================================================
-- END OF E-COMMERCE SQL ANALYSIS
-- =====================================================

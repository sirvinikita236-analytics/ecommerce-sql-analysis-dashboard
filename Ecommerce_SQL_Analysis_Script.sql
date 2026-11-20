
USE ecommerce_analysis;

-- ==========================================
-- E-COMMERCE SQL ANALYSIS
-- ==========================================

-- 1. DATASET OVERVIEW

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT order_id) AS unique_orders,
    MIN(order_purchase_timestamp) AS first_order_date,
    MAX(order_purchase_timestamp) AS last_order_date
FROM orders;


-- 2. MONTHLY ORDER TREND

SELECT
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_purchase_timestamp, '%Y-%m')
ORDER BY order_month;


-- 3. AVERAGE ORDER VALUE
-- PROVISIONAL: Payment data requires validation.

SELECT
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM (
    SELECT
        order_id,
        SUM(payment_value) AS order_total
    FROM payments
    GROUP BY order_id
) AS order_payments;


-- ==========================================
-- DATA QUALITY VALIDATION
-- ==========================================

-- 4. PRODUCT ID MATCHING AUDIT

SELECT
    COUNT(*) AS total_order_items,
    COUNT(p.product_id) AS matched_records,
    COUNT(*) - COUNT(p.product_id) AS unmatched_records
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id;


-- 5. PAYMENT TYPE VALIDATION

SELECT
    COUNT(*) AS total_payment_records,

    SUM(CASE
        WHEN payment_type IN (
            'credit_card',
            'boleto',
            'voucher',
            'debit_card',
            'not_defined'
        ) THEN 1 ELSE 0
    END) AS valid_payment_types,

    SUM(CASE
        WHEN payment_type IS NULL
          OR TRIM(payment_type) = ''
        THEN 1 ELSE 0
    END) AS blank_payment_types,

    SUM(CASE
        WHEN payment_type IS NOT NULL
         AND TRIM(payment_type) <> ''
         AND payment_type NOT IN (
            'credit_card',
            'boleto',
            'voucher',
            'debit_card',
            'not_defined'
         ) THEN 1 ELSE 0
    END) AS unexpected_payment_types

FROM payments;

-- 6. TOTAL UNIQUE CUSTOMERS
-- Verified result: 21,640

SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers;	


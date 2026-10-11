DROP TABLE IF EXISTS customer_base;

CREATE TABLE customer_base AS
SELECT
    customer_id,
    MIN(country)                AS country,
    COUNT(DISTINCT invoice_no)  AS order_count,
    SUM(quantity)               AS total_items,
    ROUND(SUM(line_revenue)::NUMERIC, 2) AS total_revenue,
    MIN(invoice_date)           AS first_invoice_date,
    MAX(invoice_date)           AS last_invoice_date
FROM clean_transactions
GROUP BY customer_id;

-- Verify the results
SELECT *
FROM customer_base
LIMIT 10;

-- Check total customers
SELECT COUNT(*) AS total_customers
FROM customer_base;

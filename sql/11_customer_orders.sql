-- 11_customer_orders.sql
DROP TABLE IF EXISTS customer_orders;
CREATE TABLE customer_orders AS
SELECT
    customer_id,
    invoice_no,
    MIN(invoice_ts)          AS order_ts,
    MIN(order_date)          AS order_date,
    MIN(order_month)         AS order_month,
    COUNT(*)                 AS items,
    ROUND(SUM(revenue), 2)   AS order_revenue
FROM clean_retail
GROUP BY customer_id, invoice_no;

SELECT COUNT(*) AS orders, COUNT(DISTINCT invoice_no) AS distinct_invoices
FROM customer_orders;
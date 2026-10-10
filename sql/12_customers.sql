-- 12_customers.sql
DROP TABLE IF EXISTS customers;
CREATE TABLE customers AS
SELECT
    customer_id,
    MIN(order_date)               AS first_order_date,
    MAX(order_date)               AS last_order_date,
    MIN(order_month)              AS first_order_month,
    COUNT(*)                      AS n_orders,
    ROUND(SUM(order_revenue), 2)  AS total_revenue,
    ROUND(AVG(order_revenue), 2)  AS avg_order_value
FROM customer_orders
GROUP BY customer_id;

ALTER TABLE customers ADD COLUMN country TEXT;
UPDATE customers SET country = (
    SELECT MAX(country) FROM clean_retail c WHERE c.customer_id = customers.customer_id
);

ALTER TABLE customers ADD COLUMN is_repeat_customer INTEGER;
UPDATE customers SET is_repeat_customer = CASE WHEN n_orders >= 2 THEN 1 ELSE 0 END;

SELECT ROUND(100.0 * SUM(is_repeat_customer) / COUNT(*), 1) AS repeat_pct FROM customers;
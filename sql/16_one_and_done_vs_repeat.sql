-- Business question #1: are customers coming back after their first
-- purchase, or is this a one-and-done business?
SELECT
    CASE WHEN order_count = 1 THEN 'one_and_done' ELSE 'repeat_customer' END AS customer_type,
    COUNT(*) AS num_customers,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM customer_base), 1) AS pct_of_customers,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    ROUND(100.0 * SUM(total_revenue) / (SELECT SUM(total_revenue) FROM customer_base), 1) AS pct_of_revenue
FROM customer_base
GROUP BY customer_type;
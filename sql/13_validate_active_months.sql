SELECT COUNT(DISTINCT customer_id) AS customers_with_activity,
       (SELECT COUNT(*) FROM customer_base) AS total_customers
FROM customer_active_months;

SELECT COUNT(*) AS customers_missing_activity
FROM customer_base cb
LEFT JOIN customer_active_months cam ON cb.customer_id = cam.customer_id
WHERE cam.customer_id IS NULL;
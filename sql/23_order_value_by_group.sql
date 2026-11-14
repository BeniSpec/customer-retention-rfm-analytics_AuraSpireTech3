-- 23_order_value_by_group.sql
SELECT CASE WHEN order_count > 1 THEN 'Repeat buyers' ELSE 'One-and-done' END AS buyer_type,
       COUNT(*) AS customers,
       ROUND(AVG(order_count)::numeric,2) AS avg_orders_per_customer,
       ROUND((SUM(total_revenue)/SUM(order_count))::numeric,2) AS avg_order_value,
       ROUND((SUM(total_revenue)/COUNT(*))::numeric,2) AS revenue_per_customer
FROM customer_base GROUP BY 1 ORDER BY 1 DESC;
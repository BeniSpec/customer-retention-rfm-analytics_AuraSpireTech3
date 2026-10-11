SELECT COUNT(*) AS negative_month_index FROM customer_month_index WHERE month_index < 0;

SELECT COUNT(DISTINCT customer_id) AS customers_with_month_zero
FROM customer_month_index WHERE month_index = 0;

SELECT COUNT(*) AS total_rows,
       (SELECT COUNT(*) FROM customer_active_months) AS active_month_rows
FROM customer_month_index;
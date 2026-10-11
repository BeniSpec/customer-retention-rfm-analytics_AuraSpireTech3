SELECT COUNT(*) AS customers_in_base,
       (SELECT COUNT(DISTINCT customer_id) FROM clean_transactions) AS customers_in_view
FROM customer_base;

SELECT ROUND(SUM(total_revenue), 2) AS base_revenue,
       (SELECT ROUND(SUM(line_revenue), 2) FROM clean_transactions) AS view_revenue
FROM customer_base;

SELECT MIN(first_invoice_date) AS earliest_date, MAX(last_invoice_date) AS latest_date
FROM customer_base;

SELECT COUNT(*) AS bad_dates FROM customer_base WHERE first_invoice_date > last_invoice_date;
SELECT COUNT(*) AS no_orders FROM customer_base WHERE order_count < 1;
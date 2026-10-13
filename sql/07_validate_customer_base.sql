-- Verify customer_base is a complete, correct summary of clean_transactions.
-- All checks combined into one row so every result is visible at once.
SELECT
    (SELECT COUNT(*) FROM customer_base) AS customers_in_base,
    (SELECT COUNT(DISTINCT customer_id) FROM clean_transactions) AS customers_in_view,
    (SELECT ROUND(SUM(total_revenue), 2) FROM customer_base) AS base_revenue,
    (SELECT ROUND(SUM(line_revenue), 2) FROM clean_transactions) AS view_revenue,
    (SELECT MIN(first_invoice_date) FROM customer_base) AS earliest_date,
    (SELECT MAX(last_invoice_date) FROM customer_base) AS latest_date,
    (SELECT COUNT(*) FROM customer_base WHERE first_invoice_date > last_invoice_date) AS bad_dates,
    (SELECT COUNT(*) FROM customer_base WHERE order_count < 1) AS no_orders;
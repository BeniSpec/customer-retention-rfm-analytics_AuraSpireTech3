-- Expect 541,909 rows.
SELECT COUNT(*) AS total_rows FROM raw_transactions;

SELECT COUNT(DISTINCT customer_id) AS customers,
       COUNT(DISTINCT invoice_no)  AS invoices
FROM raw_transactions;
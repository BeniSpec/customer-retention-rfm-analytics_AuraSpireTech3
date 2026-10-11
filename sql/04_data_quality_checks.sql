SELECT 'missing_customer_id' AS check_name, COUNT(*) AS rows_affected
FROM raw_transactions WHERE customer_id IS NULL
UNION ALL
SELECT 'cancelled_invoices', COUNT(*)
FROM raw_transactions WHERE invoice_no LIKE 'C%'
UNION ALL
SELECT 'zero_or_negative_quantity', COUNT(*)
FROM raw_transactions WHERE quantity <= 0
UNION ALL
SELECT 'zero_or_negative_price', COUNT(*)
FROM raw_transactions WHERE unit_price <= 0
UNION ALL
SELECT 'non_product_stock_codes', COUNT(*)
FROM raw_transactions
WHERE stock_code IN ('POST','D','M','BANK CHARGES','DOT','CRUK')
UNION ALL
SELECT 'exact_duplicate_rows',
       COUNT(*) - (SELECT COUNT(*) FROM (SELECT DISTINCT * FROM raw_transactions) d)
FROM raw_transactions;

-- Any stock code that doesn't start with a digit is worth a look.
SELECT stock_code, COUNT(*) AS lines
FROM raw_transactions
WHERE stock_code !~ '^[0-9]'
GROUP BY stock_code
ORDER BY lines DESC
LIMIT 20;
-- 03_customerid_check.sql
-- Rows with no customer ID cannot be used for retention analysis.
-- Blank IDs may be stored as NULL or as empty text, so check both.
SELECT
    COUNT(*) AS rows_without_customer,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM staging_online_retail), 2) AS pct_of_rows
FROM staging_online_retail
WHERE CustomerID IS NULL OR TRIM(CustomerID) = '';

-- How many different customers exist?
SELECT COUNT(DISTINCT CustomerID) AS distinct_customers
FROM staging_online_retail
WHERE CustomerID IS NOT NULL AND TRIM(CustomerID) <> '';

-- How many rows are cancellations (InvoiceNo starts with C)?
SELECT COUNT(*) AS cancellation_rows
FROM staging_online_retail
WHERE InvoiceNo LIKE 'C%';

-- Results (10 Oct 2026):
-- 135,080 rows without a customer ID = 24.93% of rows
-- 4,372 distinct customers
-- 9,288 cancellation rows
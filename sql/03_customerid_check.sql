-- 03_customerid_check.sql
-- Rows with no customer ID cannot be used for retention analysis.
-- Blank IDs may be stored as NULL or as empty text, so check both.
SELECT
    COUNT(*) AS rows_without_customer,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM staging_online_retail), 2) AS pct_of_rows
FROM staging_online_retail
WHERE CustomerID IS NULL OR TRIM(CustomerID) = '';
-- 05_remove_duplicates.sql
-- Step 1: how many rows are exact copies of another row?
SELECT COUNT(*) AS duplicate_groups, SUM(n - 1) AS extra_rows
FROM (
    SELECT COUNT(*) AS n
    FROM staging_online_retail
    GROUP BY InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country
    HAVING COUNT(*) > 1
);
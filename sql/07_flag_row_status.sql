-- 07_flag_row_status.sql
-- How are missing customer IDs stored?
SELECT
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END)       AS null_ids,
    SUM(CASE WHEN TRIM(CustomerID) = '' THEN 1 ELSE 0 END)    AS blank_ids,
    SUM(CASE WHEN CustomerID LIKE '%.0' THEN 1 ELSE 0 END)    AS ids_ending_dot_zero
FROM retail_dated;

-- Preview the status logic on 20 rows
SELECT InvoiceNo, StockCode, Quantity, UnitPrice, CustomerID,
    CASE
        WHEN InvoiceNo LIKE 'C%'                               THEN 'RETURN'
        WHEN StockCode NOT GLOB '[0-9]*'                       THEN 'NON_PRODUCT'
        WHEN UnitPrice <= 0 OR Quantity <= 0                   THEN 'BAD_PRICE_QTY'
        WHEN CustomerID IS NULL OR TRIM(CustomerID) = ''       THEN 'NO_CUSTOMER'
        ELSE 'VALID'
    END AS row_status
FROM retail_dated
LIMIT 20;
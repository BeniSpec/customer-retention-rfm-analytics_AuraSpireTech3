-- 07_flag_row_status.sql
-- How are missing customer IDs stored?
SELECT
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END)       AS null_ids,
    SUM(CASE WHEN TRIM(CustomerID) = '' THEN 1 ELSE 0 END)    AS blank_ids,
    SUM(CASE WHEN CustomerID LIKE '%.0' THEN 1 ELSE 0 END)    AS ids_ending_dot_zero
FROM retail_dated;
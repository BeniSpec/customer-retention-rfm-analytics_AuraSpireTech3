-- 02_row_count_check.sql
-- Expect 541909 rows
SELECT COUNT(*) AS total_rows FROM staging_online_retail;

-- Preview the first rows and confirm Quantity / UnitPrice are numeric
SELECT * FROM staging_online_retail LIMIT 10;
SELECT typeof(Quantity), typeof(UnitPrice), COUNT(*)
FROM staging_online_retail
GROUP BY 1, 2;
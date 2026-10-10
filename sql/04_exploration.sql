-- 04_exploration.sql
-- How many countries?
SELECT COUNT(DISTINCT Country) AS countries FROM staging_online_retail;

-- InvoiceDate is stored as text (M/D/YYYY H:MM), so MIN/MAX on it would be wrong.
-- It is converted to a real timestamp on Day 2.
SELECT DISTINCT InvoiceDate FROM staging_online_retail LIMIT 10;
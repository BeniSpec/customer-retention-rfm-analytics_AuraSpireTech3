-- 04_exploration.sql
-- How many countries?
SELECT COUNT(DISTINCT Country) AS countries FROM staging_online_retail;

-- InvoiceDate is stored as text (M/D/YYYY H:MM), so MIN/MAX on it would be wrong.
-- It is converted to a real timestamp on Day 2.
SELECT DISTINCT InvoiceDate FROM staging_online_retail LIMIT 10;

-- Result: InvoiceDate is text in DD/MM/YYYY HH:MM format (for example 01/12/2010 08:26 = 1 December 2010).

SELECT * FROM staging_online_retail LIMIT 20;
-- 08_returns_table.sql
DROP TABLE IF EXISTS returns_retail;
CREATE TABLE returns_retail AS
SELECT * FROM retail_flagged WHERE row_status = 'RETURN';

SELECT COUNT(*) AS return_rows FROM returns_retail;
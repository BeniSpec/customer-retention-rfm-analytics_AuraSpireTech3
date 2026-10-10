-- 09_clean_table.sql
DROP TABLE IF EXISTS clean_retail;
CREATE TABLE clean_retail AS
SELECT
    CAST(CAST(CustomerID AS REAL) AS INTEGER) AS customer_id,
    InvoiceNo                                 AS invoice_no,
    StockCode                                 AS stock_code,
    Description                               AS description,
    Quantity                                  AS quantity,
    UnitPrice                                 AS unit_price,
    ROUND(Quantity * UnitPrice, 2)            AS revenue,
    invoice_ts,
    date(invoice_ts)                          AS order_date,
    strftime('%Y-%m', invoice_ts)             AS order_month,
    Country                                   AS country
FROM retail_flagged
WHERE row_status = 'VALID';

CREATE INDEX idx_clean_customer ON clean_retail(customer_id);
CREATE INDEX idx_clean_date ON clean_retail(order_date);

DROP TABLE IF EXISTS unassigned_retail;
CREATE TABLE unassigned_retail AS
SELECT *, ROUND(Quantity * UnitPrice, 2) AS revenue
FROM retail_flagged
WHERE row_status = 'NO_CUSTOMER';
-- Cleaning rules and why:
-- 1. customer_id must exist: we cannot follow a customer over time without it.
-- 2. quantity > 0 and unit_price > 0: removes returns, adjustments and free items.
-- 3. invoice_no not starting with 'C': removes cancellations.
-- 4. non-product codes removed: postage, fees, manual entries, samples and
--    gift-card/dotcom-gift-voucher lines are not real product purchases.
--
-- Date parsing: to_timestamp() reads the UK format 'DD/MM/YYYY HH24:MI'
-- directly, whether or not the day/month/hour is zero-padded, and returns
-- a real timestamp -- no string-splicing needed.
DROP VIEW IF EXISTS clean_transactions;

CREATE VIEW clean_transactions AS
SELECT
    invoice_no,
    stock_code,
    description,
    quantity,
    to_timestamp(invoice_date, 'DD/MM/YYYY HH24:MI') AS invoice_date,
    unit_price,
    customer_id,
    country,
    quantity * unit_price AS line_revenue,
    to_char(to_timestamp(invoice_date, 'DD/MM/YYYY HH24:MI'), 'YYYY-MM') AS invoice_month
FROM raw_transactions
WHERE customer_id IS NOT NULL
  AND quantity > 0
  AND unit_price > 0
  AND invoice_no NOT LIKE 'C%'
  AND stock_code NOT IN ('POST','D','M','BANK CHARGES','DOT','CRUK','C2','S','AMAZONFEE','PADS','B')
  AND stock_code NOT LIKE 'gift\_0001%' ESCAPE '\'
  AND stock_code NOT LIKE 'DCGS%';
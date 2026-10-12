-- Business question: how long does it typically take a customer to come
-- back, if they come back at all?
DROP TABLE IF EXISTS repurchase_gap;

CREATE TABLE repurchase_gap AS
WITH invoice_level AS (
    SELECT customer_id, invoice_no, MIN(invoice_date) AS invoice_date
    FROM clean_transactions
    GROUP BY customer_id, invoice_no
),
ranked AS (
    SELECT customer_id, invoice_date,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY invoice_date) AS rn
    FROM invoice_level
)
SELECT
    a.customer_id,
    a.invoice_date AS first_purchase_date,
    b.invoice_date AS second_purchase_date,
    EXTRACT(DAY FROM (b.invoice_date - a.invoice_date))::INT AS days_to_repurchase
FROM ranked a
JOIN ranked b ON a.customer_id = b.customer_id AND b.rn = 2
WHERE a.rn = 1;
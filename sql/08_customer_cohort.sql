-- Business question: in which month did each customer make their first
-- valid purchase? This "cohort month" anchors every retention number below.
DROP TABLE IF EXISTS customer_cohort;

CREATE TABLE customer_cohort AS
SELECT
    customer_id,
    to_char(first_invoice_date, 'YYYY-MM') AS cohort_month
FROM customer_base;
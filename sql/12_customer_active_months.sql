-- Business question: which months was each customer actually active in?
DROP TABLE IF EXISTS customer_active_months;

CREATE TABLE customer_active_months AS
SELECT DISTINCT customer_id, invoice_month AS active_month
FROM clean_transactions;
-- Business question: how does retention change by acquisition cohort?
-- For every cohort, what % of its customers were still active in month 0,
-- month 1, month 2, and so on.
DROP TABLE IF EXISTS retention_matrix;

CREATE TABLE retention_matrix AS
SELECT
    cmi.cohort_month,
    cmi.month_index,
    COUNT(DISTINCT cmi.customer_id) AS active_customers,
    cs.cohort_size,
    ROUND(100.0 * COUNT(DISTINCT cmi.customer_id) / cs.cohort_size, 1) AS retention_rate_pct
FROM customer_month_index cmi
JOIN cohort_sizes cs ON cmi.cohort_month = cs.cohort_month
GROUP BY cmi.cohort_month, cmi.month_index, cs.cohort_size
ORDER BY cmi.cohort_month, cmi.month_index;
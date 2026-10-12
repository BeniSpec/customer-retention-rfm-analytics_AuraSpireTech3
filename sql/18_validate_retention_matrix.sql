-- Month 0 should always be 100% (every customer is active in their own cohort month).
SELECT COUNT(*) AS rows_not_100_at_month_zero
FROM retention_matrix
WHERE month_index = 0 AND retention_rate_pct <> 100.0;

-- Retention should never exceed 100%.
SELECT COUNT(*) AS rows_over_100_pct
FROM retention_matrix
WHERE retention_rate_pct > 100.0;

SELECT COUNT(*) AS total_rows FROM retention_matrix;
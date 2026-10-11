-- Business question: how many new customers did we acquire each month?
DROP TABLE IF EXISTS cohort_sizes;

CREATE TABLE cohort_sizes AS
SELECT cohort_month, COUNT(*) AS cohort_size
FROM customer_cohort
GROUP BY cohort_month
ORDER BY cohort_month;
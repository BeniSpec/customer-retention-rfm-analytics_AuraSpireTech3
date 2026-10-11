SELECT COUNT(*) AS customers_in_cohort,
       (SELECT COUNT(*) FROM customer_base) AS customers_in_base
FROM customer_cohort;

SELECT COUNT(*) AS missing_cohort_month FROM customer_cohort WHERE cohort_month IS NULL;

SELECT MIN(cohort_month) AS earliest_cohort, MAX(cohort_month) AS latest_cohort
FROM customer_cohort;
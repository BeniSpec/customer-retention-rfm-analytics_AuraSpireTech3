SELECT SUM(cohort_size) AS total_from_cohorts,
       (SELECT COUNT(*) FROM customer_base) AS total_customers
FROM cohort_sizes;
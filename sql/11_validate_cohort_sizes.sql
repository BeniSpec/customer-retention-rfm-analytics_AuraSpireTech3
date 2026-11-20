-- Validates cohort totals against the total customer count.
-- Checks whether the sum of all cohort sizes matches the
-- number of customers in the customer_base table.

SELECT SUM(cohort_size) AS total_from_cohorts,
       (SELECT COUNT(*) FROM customer_base) AS total_customers
FROM cohort_sizes;
-- 24_one_and_done_by_cohort.sql
SELECT cc.cohort_month, COUNT(*) AS customers,
       SUM(CASE WHEN cb.order_count = 1 THEN 1 ELSE 0 END) AS one_and_done,
       ROUND((100.0*SUM(CASE WHEN cb.order_count = 1 THEN 1 ELSE 0 END)/COUNT(*))::numeric,1) AS one_and_done_pct
FROM customer_cohort cc JOIN customer_base cb USING (customer_id)
GROUP BY cc.cohort_month ORDER BY cc.cohort_month;
-- Note: later cohorts have had less time to repurchase; Dec 2011 is incomplete.
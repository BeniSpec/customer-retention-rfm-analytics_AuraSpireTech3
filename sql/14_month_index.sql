-- Business question: how many months after their first purchase is each
-- active month? month_index 0 = cohort month, 1 = the next month, etc.
DROP TABLE IF EXISTS customer_month_index;

CREATE TABLE customer_month_index AS
SELECT
    cam.customer_id,
    cc.cohort_month,
    cam.active_month,
    (EXTRACT(YEAR FROM to_date(cam.active_month,'YYYY-MM'))::INT * 12
       + EXTRACT(MONTH FROM to_date(cam.active_month,'YYYY-MM'))::INT)
    -
    (EXTRACT(YEAR FROM to_date(cc.cohort_month,'YYYY-MM'))::INT * 12
       + EXTRACT(MONTH FROM to_date(cc.cohort_month,'YYYY-MM'))::INT)
    AS month_index
FROM customer_active_months cam
JOIN customer_cohort cc ON cam.customer_id = cc.customer_id;
-- Business question: what's the typical gap between a customer's purchases?
SELECT
    (SELECT COUNT(*) FROM repurchase_gap WHERE days_to_repurchase < 0) AS negative_gaps,
    (SELECT MIN(days_to_repurchase) FROM repurchase_gap) AS min_days,
    (SELECT ROUND(AVG(days_to_repurchase), 1) FROM repurchase_gap) AS avg_days,
    (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY days_to_repurchase) FROM repurchase_gap) AS median_days,
    (SELECT MAX(days_to_repurchase) FROM repurchase_gap) AS max_days;

-- Bucketed view of the same thing
SELECT
    CASE
        WHEN days_to_repurchase <= 7 THEN '0-7 days'
        WHEN days_to_repurchase <= 30 THEN '8-30 days'
        WHEN days_to_repurchase <= 90 THEN '31-90 days'
        ELSE '90+ days'
    END AS gap_bucket,
    COUNT(*) AS num_customers
FROM repurchase_gap
GROUP BY 1
ORDER BY MIN(days_to_repurchase);
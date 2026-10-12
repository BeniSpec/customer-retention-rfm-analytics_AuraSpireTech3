-- Business question: what's the typical gap, for a marketing reminder-timing decision?
SELECT
    MIN(days_to_repurchase) AS min_days,
    ROUND(AVG(days_to_repurchase), 1) AS avg_days,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY days_to_repurchase) AS median_days,
    MAX(days_to_repurchase) AS max_days
FROM repurchase_gap;

SELECT
    CASE
        WHEN days_to_repurchase <= 7 THEN '0-7 days'
        WHEN days_to_repurchase <= 30 THEN '8-30 days'
        WHEN days_to_repurchase <= 90 THEN '31-90 days'
        ELSE '90+ days'
    END AS gap_bucket,
    COUNT(*) AS num_customers
FROM repurchase_gap
GROUP BY gap_bucket
ORDER BY MIN(days_to_repurchase);
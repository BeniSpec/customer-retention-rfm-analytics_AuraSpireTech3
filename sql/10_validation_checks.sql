-- 10_validation_checks.sql
-- Check 1: every deduplicated row lands in exactly one bucket (the two numbers must match)
SELECT
    (SELECT COUNT(*) FROM retail_dedup) AS dedup_rows,
    (SELECT COUNT(*) FROM clean_retail)
  + (SELECT COUNT(*) FROM returns_retail)
  + (SELECT COUNT(*) FROM unassigned_retail)
  + (SELECT COUNT(*) FROM retail_flagged WHERE row_status IN ('NON_PRODUCT','BAD_PRICE_QTY'))
    AS accounted_rows;

-- Check 1b: raw rows (expect 541909)
SELECT COUNT(*) AS raw_rows FROM staging_online_retail;
SELECT COUNT(*) AS negative_gaps FROM repurchase_gap WHERE days_to_repurchase < 0;

-- Should roughly match the repeat_customer count from sql/16.
SELECT COUNT(*) AS repeat_customers_in_gap_table FROM repurchase_gap;
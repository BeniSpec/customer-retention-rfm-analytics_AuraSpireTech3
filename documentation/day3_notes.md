# Day 3 — Retention Matrix & Repurchase Gap Notes

## Business questions
1. How does retention decay over time for each monthly cohort — what % of customers are still buying in month 1, month 2, and so on?
2. How long does it typically take a repeat customer to come back and buy again?

## What was built
- `retention_matrix` — a cohort_month × month_index grid showing the % of each cohort still active in each month after their first purchase.
- `repurchase_gap` — the number of days between a repeat customer's first and second order (and subsequent orders), used to measure typical time-to-repurchase.
- `repurchase_gap_summary` — the same gap data bucketed into 0–7, 8–30, 31–90, and 90+ day groups, plus overall min/average/median/max.

## Confirmed numbers
- Retention matrix: 91 cohort/month_index rows built, fully validated (month 0 always 100%, no row exceeds 100%).
- Repeat customers: 2,829 (65.3% of base), generating £8,132,096.98 (92.8% of revenue).
- One-and-done customers: 1,505 (34.7% of base), generating £628,969.67 (7.2% of revenue).
- Repurchase gap: 0 negative gaps (no bad data), min 0 days, average 76.7 days, median 51 days, max 365 days.
- Gap buckets: 0–7 days = 424 customers, 8–30 days = 534, 31–90 days = 962, 90+ days = 909.

## Headline finding
A third of customers never return after their first order, but the two-thirds who do generate nearly all the revenue — and half of those repeat customers come back within about 7 weeks, though a long tail takes up to a year.
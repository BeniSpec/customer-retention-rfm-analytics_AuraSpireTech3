# Day 5 — Tableau Dashboard Notes

## Business question
Can the retention and RFM findings from Days 3–4 be put in front of a non-technical stakeholder as a single, explorable view, rather than tables and static charts?

## What was built
One Tableau Packaged Workbook (`tableau/retention_rfm_dashboard.twbx`) with three linked sheets on one dashboard:
- Retention Curve (cohort retention over time)
- Revenue by RFM Segment
- Customer Recency vs Frequency by Segment (scatter)

## Why Tableau Public
Free, no license required, and the packaged-workbook format bundles data with the workbook so it opens correctly on any machine without re-linking files — appropriate for a portfolio piece reviewers will open themselves.

## Data sources
`retention_matrix.csv` and `rfm_segments.csv`, both exported directly from Postgres via pgAdmin's Import/Export dialog — no manual reformatting needed.

## Headline finding
Champions hold the largest share of revenue on the dashboard's segment-revenue view, consistent with the Day 4 finding. The retention curve confirms the steepest drop in active customers happens within the first month after a cohort's first purchase, after which the decline flattens for those who remain.
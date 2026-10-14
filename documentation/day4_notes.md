# Day 4 — Python Analysis Notes

## Business question
Beyond knowing retention *rates* (Day 3), who specifically are our best and most at-risk customers, and how much revenue is concentrated in each group?

## What was built
1. **Retention curve** (`01_cohort_retention.ipynb`) — a visual version of the `retention_matrix` table from Day 3, making the drop-off pattern immediately visible across cohorts rather than reading a grid of numbers.
2. **RFM segmentation** (`02_rfm_segmentation.ipynb`) — classifies every customer into one of 6 behavioural segments based on how recently, how often, and how much they buy.

## Method
- Recency, Frequency, Monetary each split into 5 quintiles using `pd.qcut`.
- Recency is scored in reverse (fewer days since last order = score 5) since lower recency is better.
- The 3 scores combine into a 3-digit `rfm_score` (e.g. "545") and a named segment via a simple rule set.

## Why Colab, not local Python
No install required, works in any browser, and file upload/download replaces a local DB connection — consistent with keeping this project runnable on a basic laptop.

## Headline finding
Champions make up a small share of customers but clearly dominate total revenue on the segment-revenue chart, while Hibernating and New Customers contribute the least. This confirms the same pattern seen in Day 3: a small core of engaged, high-value customers accounts for most of the money, while a long tail of low-engagement customers contributes very little.
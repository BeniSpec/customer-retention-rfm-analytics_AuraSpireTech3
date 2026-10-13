# python/

Notebooks built in Google Colab, using CSVs exported from PostgreSQL via pgAdmin (data/processed/, not committed).

Notebook order:
1. 01_cohort_retention.ipynb — retention matrix chart
2. 02_rfm_segmentation.ipynb — RFM scores and customer segments
3. 03_segment_profiles.ipynb — who each segment is and what they're worth

## Python Analysis

Two Jupyter notebooks (run in Google Colab, no local Python install needed) turn the Postgres exports into the project's core visuals:

- `python/01_cohort_retention.ipynb` — reshapes `retention_matrix.csv` into a cohort × month-index pivot table and plots a retention curve (one line per cohort, showing the % of each cohort still buying in each month after their first purchase).
- `python/02_rfm_segmentation.ipynb` — scores every customer on Recency, Frequency and Monetary value (quintiles 1–5 each), combines them into an `rfm_score`, and maps that to a named segment (Champions, Loyal, Potential Loyalists, New Customers, At Risk, Hibernating). Outputs `rfm_segments.csv`, used directly by the Tableau dashboard in Day 5.

Outputs (chart images) are saved under `python/outputs/`.
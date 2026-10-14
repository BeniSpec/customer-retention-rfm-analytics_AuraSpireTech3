# python/

Notebooks built in Google Colab, using CSVs exported from PostgreSQL via pgAdmin (data/processed/, not committed to Git).

## Notebooks

- `01_cohort_retention.ipynb` — reshapes `retention_matrix.csv` into a cohort × month-index pivot table and plots a retention curve (one line per cohort, showing the % of each cohort still buying in each month after their first purchase).
- `02_rfm_segmentation.ipynb` — scores every customer on Recency, Frequency and Monetary value (quintiles 1–5 each), combines them into an `rfm_score`, and maps that to a named segment (Champions, Loyal, Potential Loyalists, New Customers, At Risk, Hibernating). Outputs `rfm_segments.csv`, used directly by the Tableau dashboard in Day 5.

Outputs (chart images) are saved under `outputs/`.
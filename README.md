# Customer Retention, Cohort & RFM Analysis

> Are customers coming back after their first purchase, and which customers should we focus on keeping?

Part of the AuraSpire Tech data analyst portfolio.

**Tools:** PostgreSQL (pgAdmin), Python (Pandas, NumPy, Matplotlib) via Google Colab, Tableau Public, Git/GitHub Desktop
**Status:** Complete (6 of 6 days)

## Executive Summary

This project analyzes customer retention and purchasing behavior for a UK-based online retailer using cohort analysis, RFM segmentation, and repurchase timing. Of 4,334 customers, 65.3% are repeat buyers generating 92.8% of all revenue, while 34.7% purchase only once. Retention drops sharply in the first month after a customer's initial purchase, and repeat customers typically return within ~51 days (median). Full findings and recommendations are in `documentation/day6_findings.md`.

## 1. Business problem

Marketing says: "We are acquiring customers, but we don't know whether they are returning. Which customers should we focus on retaining?"

This project answers that question with real transaction data from a UK-based online retailer. The goal is not a dashboard — the goal is a clear recommendation: who comes back, who is slipping away, and what the business should do differently for each group.

The dataset is the same one used in Project 1 (Retail Sales Performance), but the stakeholder question is different.

### Key questions

1. Are customers returning after their first purchase?
2. How does retention change by acquisition cohort?
3. Which customers are high-value, frequent, or at risk of churning?
4. How long does it take customers to purchase again?
5. Which segments should receive different retention strategies?

## 2. Dataset

- **Source:** UCI Machine Learning Repository, Online Retail dataset
- **Size:** 541,909 transaction lines
- **Period:** December 2010 to December 2011
- **Business:** a UK-based online gift and homeware retailer
- **Columns (8):** InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country

Full column descriptions are in documentation/data_dictionary.md.

## 3. Data quality and cleaning

Starting from 541,909 raw transaction lines, the following rules were applied (full detail in documentation/cleaning_rules.md and sql/05_clean_transactions.sql):

- 135,080 rows removed for missing CustomerID
- 9,288 cancelled invoices removed
- Non-positive quantity/price rows removed (returns, adjustments, free items)
- Non-product stock codes removed (postage, fees, gift cards, manual entries)

Result: 396,337 clean transaction lines, covering 4,334 customers with total revenue of £8,761,066.65, date range 2010-12-01 to 2011-12-09. Validated with 0 bad dates and 0 customers with no orders (sql/07).

## 4. Analytical methodology

Cohort and retention analysis, entirely in SQL (PostgreSQL):

1. Each customer gets a **cohort month** — the month of their first valid purchase (sql/08).
2. Cohort sizes are counted per month (sql/10).
3. Every month a customer was actually active is recorded (sql/12).
4. Each active month becomes a **month_index** relative to the cohort month, via whole-month arithmetic (sql/14).
5. A **retention_matrix** cross-tabulates cohort_month against month_index, showing the % of each cohort still active in each subsequent month (sql/17).
6. A **repurchase_gap** measures the days between a repeat customer's consecutive orders, bucketed to show how quickly customers typically return (sql/19–21).

RFM segmentation and visualization (Python, Day 4): see section 6.

## Day 3 addition: retention and repurchase

- **retention_matrix**: for every (cohort_month, month_index) pair, what % of that cohort was still active.
- **repurchase_gap**: for customers who came back, how many days between their 1st and 2nd purchase.
### Retention matrix and repurchase gap (Day 3)
`retention_matrix` cross-tabulates cohort_month against month_index to show the % of each cohort still buying in each subsequent month. `repurchase_gap` measures the days between a repeat customer's consecutive orders, bucketed to show how quickly customers typically return.

## 5. SQL analysis

All SQL lives in `sql/`, run in numeric order in pgAdmin's Query Tool against the `retention_rfm` database:

- **01–04**: create raw table, load the CSV, validate the load, data quality checks
- **05–07**: build the clean_transactions view (with native date parsing), build customer_base, validate it
- **08–16**: cohort assignment, cohort sizes, active months, month_index, one-and-done vs repeat customers
- **17–21**: retention matrix and repurchase gap analysis

Full file-by-file description in sql/README.md.

## 6. Python analysis (cohorts, RFM, retention curves)

Two notebooks (`python/`), run in Google Colab using CSVs exported from Postgres:

- `01_cohort_retention.ipynb` — turns `retention_matrix.csv` into a retention curve chart (one line per cohort).
- `02_rfm_segmentation.ipynb` — scores every customer on Recency, Frequency and Monetary value, assigns a named segment, and charts total revenue by segment. Outputs `rfm_segments.csv`, used by the Tableau dashboard.

Full methodology in documentation/day4_notes.md.

## 7. Dashboard and report

The final deliverable is a single Tableau dashboard, `tableau/retention_rfm_dashboard.twbx`, combining three views:

1. **Retention Curve** — % of each monthly cohort still purchasing in each month after their first order, one line per cohort. Shows how quickly and how hard customer retention drops off.
2. **Revenue by RFM Segment** — total revenue contributed by each customer segment (Champions, Loyal, Potential Loyalists, New Customers, At Risk, Hibernating), sorted highest to lowest. Shows where revenue is concentrated.
3. **Customer Recency vs Frequency by Segment** — a scatter plot of all customers, positioned by how recently and how often they buy, colored by segment and sized by spend. Shows the behavioural shape of each segment at a glance.

Data sources: `data/processed/retention_matrix.csv` and `data/processed/rfm_segments.csv`, both exported from the project's Postgres database (see `sql/`).

To view: open the `.twbx` file in Tableau Public Desktop (free) or Tableau Desktop — it's a packaged workbook, so no separate data connection setup is needed.

## 8. Key findings

1. Retention drops off sharply after the first purchase — most of each cohort's decline happens in month 1, then flattens out.
2. 34.7% of customers (1,505) are one-and-done; the remaining 65.3% (2,829) are repeat customers.
3. Repeat customers generate 92.8% of total revenue (£8,132,096.98) vs 7.2% (£628,969.67) from one-and-done customers.
4. The median repurchase gap is 51 days (average 76.7, pulled up by a long tail reaching 365 days).
5. Revenue is concentrated in a small number of high-value RFM segments (Champions, Loyal), while At Risk and Hibernating segments hold real but currently inactive value.

Full detail in documentation/day6_findings.md.

## 9. Business recommendations

1. Focus retention effort in the first 30–60 days after a customer's first purchase, where the steepest drop-off happens.
2. Build a win-back campaign targeted at At Risk and Hibernating customers.
3. Protect and reward the Champions segment — a small group driving a disproportionate share of revenue.
4. Time re-engagement offers around day 45–60 after a customer's last purchase, matching the observed median repurchase gap of 51 days.

Full reasoning in documentation/day6_findings.md.

## 10. Limitations and assumptions

- Customers are tracked by CustomerID. Rows without one cannot be followed over time, so they are left out of retention and RFM.
- The data covers about 13 months and ends in early December 2011. The last month is incomplete, so it is excluded from the retention curves.
- With one year of data we cannot see yearly buying patterns or long-term lifetime value.
- A few large wholesale customers may distort revenue averages.
- A few customers appear under more than one country; one country per customer is used.
- Cancelled invoices are removed, not netted against the original orders.

## 11. How to reproduce

1. Download the dataset from the UCI Machine Learning Repository (link in data/README.md).
2. Save it as data/raw/online_retail.csv, untouched.
3. Open sql/ scripts in pgAdmin's Query Tool against the retention_rfm database, in numeric order.
4. Open the notebooks in python/ in Google Colab, in order, using CSVs exported from Postgres.
5. Open the Tableau workbook in tableau/ and point it at the exported CSVs.
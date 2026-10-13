# Customer Retention, Cohort & RFM Analysis

> Are customers coming back after their first purchase, and which customers should we focus on keeping?

Part of the AuraSpire Tech data analyst portfolio.

**Tools:** Excel, SQL (PostgreSQL), Python (Pandas, NumPy, Matplotlib), Tableau, Git/GitHub
**Status:** In progress (Day 1 of 6)

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
_In progress. Cleaning rules and date parsing are written in sql/05_clean_transactions.sql._

## 4. Analytical methodology
Cohort analysis, entirely in SQL (PostgreSQL):
1. Each customer gets a **cohort month** — the month of their first valid purchase (sql/08).
2. Cohort sizes are counted per month (sql/10).
3. Every month a customer was actually active is recorded (sql/12).
4. Each active month becomes a **month_index** relative to the cohort month, via whole-month arithmetic (sql/14).

## Day 3 addition: retention and repurchase

- **retention_matrix**: for every (cohort_month, month_index) pair, what % of that cohort was still active.
- **repurchase_gap**: for customers who came back, how many days between their 1st and 2nd purchase.
### Retention matrix and repurchase gap (Day 3)
`retention_matrix` cross-tabulates cohort_month against month_index to show the % of each cohort still buying in each subsequent month. `repurchase_gap` measures the days between a repeat customer's consecutive orders, bucketed to show how quickly customers typically return.

## 5. SQL analysis
_In progress._

## 6. Python analysis (cohorts, RFM, retention curves)
_In progress._

## 7. Dashboard and report
_To be completed on Day 5 (Tableau)._

## 8. Key findings
_To be completed on Day 6._

## 9. Business recommendations
_To be completed on Day 6._

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
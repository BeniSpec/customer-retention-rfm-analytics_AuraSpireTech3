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
_In progress._

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
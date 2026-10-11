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
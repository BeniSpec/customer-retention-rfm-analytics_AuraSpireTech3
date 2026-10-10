# Customer Retention, Cohort & RFM Analysis

Do customers come back after their first purchase, and which ones should we focus on keeping?

**AuraSpire Tech — Project 3 of 5**

**Tools:** SQL (SQLite), Python (pandas), Power BI, Git/GitHub

**Status:** In progress


## Business Problem
Marketing is acquiring customers but does not know whether they return. Which customers should we focus on keeping?

### Key Questions
1. Are customers returning after their first purchase?
2. How does retention change by acquisition cohort?
3. How long does it take customers to purchase again?
4. Which customers are high-value, frequent, or at risk?
5. Which segments should receive different retention strategies?

Details: [business_questions.md](documentation/business_questions.md)

## Dataset
UCI Online Retail, 541,909 transactions, Dec 2010 to Dec 2011. Source: [Kaggle](https://www.kaggle.com/datasets/carrie1/ecommerce-data). See [data_source.md](documentation/data_source.md).

## Data Quality / Cleaning
The raw table is never edited. Exact duplicates are removed, dates are converted to ISO format, cancellations go to a returns table, non-product lines and invalid prices or quantities are excluded, and rows without a CustomerID are kept apart in `unassigned_retail`. Result: `clean_retail` holds the valid sales rows used for all customer analysis. Rules: [cleaning_rules.md](documentation/cleaning_rules.md).

## Customer Base
`customer_orders` has one row per order and `customers` has one row per customer (first order month, order count, revenue, repeat flag). These are the starting tables for the cohort and RFM work.
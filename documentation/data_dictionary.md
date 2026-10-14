# Data dictionary: Online Retail

| Column | Type | Description |
|---|---|---|
| InvoiceNo | text | Invoice number. Starts with "C" if the invoice is a cancellation |
| StockCode | text | Product code. A few codes are not products (for example postage) |
| Description | text | Product name |
| Quantity | integer | Units per line. Negative values appear on cancellations and adjustments |
| InvoiceDate | text (UK format: DD/MM/YYYY HH:MM) | Parsed to a real timestamp inside the clean_transactions view using Postgres's to_timestamp() |
| UnitPrice | numeric | Price per unit in pounds sterling |
| CustomerID | integer | Customer identifier. Missing for some rows |
| Country | text | Customer's country |

Derived column: line_revenue = Quantity x UnitPrice.

## Derived tables/views (built in sql/)

| Object | Type | Built by | Description |
|---|---|---|---|
| clean_transactions | view | sql/05 | Raw transactions after all cleaning rules, with parsed timestamp and line_revenue |
| customer_base | table | sql/06 | One row per customer: order_count, total_revenue, first/last invoice date |
| customer_cohort | table | sql/08 | Each customer's cohort_month (month of first valid purchase) |
| cohort_sizes | table | sql/10 | Number of customers per cohort_month |
| customer_active_months | table | sql/12 | Every (customer_id, invoice_month) combination the customer was active in |
| customer_month_index | table | sql/14 | Each active month expressed as month_index relative to the customer's cohort_month |
| retention_matrix | table | sql/17 | cohort_month x month_index grid of % retained |
| repurchase_gap | table | sql/19 | Days between a repeat customer's consecutive orders |
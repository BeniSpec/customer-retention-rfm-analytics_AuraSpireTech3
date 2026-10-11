# Metric definitions

| Metric | Definition |
|---|---|
| Valid order | An invoice that passes the cleaning rules (has a CustomerID, positive quantity and price, not a cancellation, not a non-product line) |
| Active customer (in a month) | A customer with at least one valid order in that calendar month |
| Repeat customer | A customer with 2 or more distinct valid invoices |
| Retention rate (cohort, month n) | Customers from a cohort who are active in month n, divided by the size of the cohort |
| Repurchase gap | Days between a customer's first and second valid invoice |
| At-risk window (proposed) | No purchase in the last 90 days, measured from the day after the last date in the data |

Note: the last month in the data is incomplete and excluded from retention curves.

## Cohort logic

- Cohort: the calendar month of a customer's first valid purchase.
- Month index: 0 is the cohort month, 1 is the following month, and so on.
- Cohort size: number of customers whose first valid purchase falls in that month.
- A customer is "retained in month n" if they have at least one valid order in the month that is n months after their cohort month.

## RFM (planned)

- Recency (R): days since the customer's last valid purchase, measured from the day after the last date in the data.
- Frequency (F): number of distinct valid invoices.
- Monetary (M): total revenue from valid orders.

Scoring plan: split each of R, F and M into 5 groups (1 to 5) using quintiles in Python. Combine scores into named segments (Champions, Loyal, Potential Loyalists, New Customers, At Risk, Hibernating).
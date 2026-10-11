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
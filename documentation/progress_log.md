# Progress log

## Day 1
**Done:** repo/tool switch to PostgreSQL + Tableau, documentation, raw table, load, quality checks, clean view with native date parsing, customer table, validation.

**Numbers from the quality checks:**
- Total rows loaded: 541,909
- Rows with missing CustomerID: 135,080
- Cancelled invoices: 9,288
- Customers in customer_base: 4,334
- Total revenue: £8,761,066.65
- Date range: 2010-12-01 to 2011-12-09
- Bad dates: 0
- Customers with no orders: 0

**Tomorrow (Day 2):** first purchase date and cohort assignment in SQL.

## Day 2
**Done:** cohort assignment, cohort sizes, active-months table, month_index, headline one-and-done vs repeat question.

**Tomorrow (Day 3):** retention matrix by cohort and month_index, repurchase gap.

## Day 3 — Retention Matrix & Repurchase Gap
- Built and validated retention_matrix (91 rows, month 0 = 100%, no rate exceeds 100%)
- Confirmed: 2,829 repeat customers (65.3%, 92.8% of revenue) vs 1,505 one-and-done (34.7%, 7.2% of revenue)
- Built and validated repurchase_gap and repurchase_gap_summary
- Confirmed: avg gap 76.7 days, median 51 days, max 365 days, 0 negative gaps
- Documented in documentation/day3_notes.md
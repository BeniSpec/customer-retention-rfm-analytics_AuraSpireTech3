# Cleaning Rules

## Principles
- The raw table `raw_transactions` is never edited or overwritten — all cleaning happens in a downstream view.
- `clean_transactions` is a VIEW (not a table) built directly from `raw_transactions`, so re-running sql/05 safely rebuilds it without touching raw data.
- Every step is checked with a row count (see sql/03, sql/04, sql/07).

## Rules applied in clean_transactions (sql/05_clean_transactions.sql)
- **R1 Missing CustomerID.** Rows with no CustomerID are excluded (135,080 rows) — they cannot be followed over time, so they're left out of customer-level analysis.
- **R2 Non-positive quantity or price.** Rows with quantity <= 0 or unit_price <= 0 are excluded — these are returns, adjustments, or free/zero-value lines.
- **R3 Cancellations.** Invoices starting with "C" are excluded (9,288 invoices) — these are cancellations, not completed sales.
- **R4 Non-product codes.** Stock codes for postage, fees, manual entries, samples, and gift-card/dotcom-gift-voucher lines are excluded (POST, D, M, BANK CHARGES, DOT, CRUK, C2, S, AMAZONFEE, PADS, B, gift_0001*, DCGS*) — these are not real product purchases.
- **R5 Dates.** InvoiceDate (UK text format DD/MM/YYYY HH:MM) is parsed directly into a real timestamp using Postgres's `to_timestamp()` — no manual reformatting or string-splicing needed.

## Result
541,909 raw rows → 396,337 rows in clean_transactions after all rules applied.

## Decisions
- Revenue used throughout this project is gross sales from valid (non-cancelled) orders. Cancelled invoices are removed entirely rather than netted against the original order — see Limitations in the main README.
- An order is one distinct invoice_no.
- `customer_base` (sql/06) is the customer-level summary built on top of `clean_transactions` — one row per customer, with order_count, total_revenue, and first/last invoice dates.
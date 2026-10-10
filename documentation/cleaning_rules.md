# Cleaning Rules

## Principles
- The raw table `staging_online_retail` is never edited.
- Every step creates a new table.
- Every step is checked with a row count.

## Rules
- **R1 Duplicates.** Exact duplicate rows removed with SELECT DISTINCT (541,909 rows to about 536,641). Why: duplicates would double-count orders.

- **R2 Dates.** InvoiceDate (text, M/D/YYYY H:MM) converted to ISO format as `invoice_ts`. Why: text dates sort and group wrongly.

- **R3 Row status.** Every row gets one status; the first match wins: RETURN, NON_PRODUCT, BAD_PRICE_QTY, NO_CUSTOMER, VALID. Why: no row is removed silently, and every removal has a reason.

- **R4 Clean table.** `clean_retail` keeps only VALID rows and adds `revenue` (Quantity × UnitPrice), `order_date` and `order_month`.

## Decisions
- Rows without a CustomerID are excluded from retention analysis and kept in `unassigned_retail`, so revenue can still be reconciled.
- Revenue used for RFM is gross sales. Returns are kept in `returns_retail`, not subtracted. Net revenue is listed as a limitation.
- Non-product StockCodes (for example POST, DOT, D, M, S, B, BANK CHARGES, AMAZONFEE, CRUK) are excluded because they are fees or postage, not products.
- An order is one distinct InvoiceNo.
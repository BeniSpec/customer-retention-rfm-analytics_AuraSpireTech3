# Cleaning Rules

## Principles
- The raw table `staging_online_retail` is never edited.
- Every step creates a new table.
- Every step is checked with a row count.

## Rules
- **R1 Duplicates.** Exact duplicate rows removed with SELECT DISTINCT (541,909 rows to about 536,641). Why: duplicates would double-count orders.

## Decisions
# data/

- `raw/`: the original dataset, exactly as downloaded/exported. Not committed to Git.
- `processed/`: CSV exports pulled from PostgreSQL for use in Python/Tableau. Not committed to Git.

## Dataset

- **Name:** Online Retail
- **Source:** UCI Machine Learning Repository: https://archive.ics.uci.edu/dataset/352/online+retail
- **Original file:** Excel, exported as CSV with InvoiceDate kept in its original UK text format (DD/MM/YYYY HH:MM). No manual reformatting is needed — PostgreSQL's `to_timestamp()` parses this format directly inside sql/05_clean_transactions.sql.
- **Location:** `data/raw/online_retail.csv`
- **Note:** this is the same source file used in Project 1 (Retail Sales Performance) — reused here to answer a different business question.
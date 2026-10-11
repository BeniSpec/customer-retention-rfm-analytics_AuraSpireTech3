-- Raw transactions exactly as exported. invoice_date stays as the original
-- UK-format text (DD/MM/YYYY HH:MM); it's parsed once, in
-- sql/05_clean_transactions.sql, using Postgres's to_timestamp().
DROP TABLE IF EXISTS raw_transactions;

CREATE TABLE raw_transactions (
    invoice_no    TEXT,
    stock_code    TEXT,
    description   TEXT,
    quantity      INTEGER,
    invoice_date  TEXT,
    unit_price    NUMERIC,
    customer_id   INTEGER,
    country       TEXT
);
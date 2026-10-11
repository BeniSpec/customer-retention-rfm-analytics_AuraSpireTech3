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
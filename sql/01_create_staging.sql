-- 01_create_staging.sql
-- Creates the raw staging table for the UCI Online Retail data.
-- The raw table is never edited after it is loaded.

CREATE TABLE staging_online_retail (
    InvoiceNo   TEXT,
    StockCode   TEXT,
    Description TEXT,
    Quantity    INTEGER,
    InvoiceDate TEXT,
    UnitPrice   REAL,
    CustomerID  TEXT,
    Country     TEXT
);
# Data dictionary: Online Retail

| Column | Type | Description |
|---|---|---|
| InvoiceNo | text | Invoice number. Starts with "C" if the invoice is a cancellation |
| StockCode | text | Product code. A few codes are not products (for example postage) |
| Description | text | Product name |
| Quantity | integer | Units per line. Negative values appear on cancellations and adjustments |
| InvoiceDate | text (UK format: DD/MM/YYYY HH:MM) | Parsed to a real timestamp inside the clean_transactions view using Postgres's to_timestamp() |
| UnitPrice | numeric | Price per unit in pounds sterling |
| CustomerID | integer | Customer identifier. Missing for some rows |
| Country | text | Customer's country |

Derived column: line_revenue = Quantity x UnitPrice.
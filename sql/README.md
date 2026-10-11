# sql/

SQL scripts, run in numeric order in pgAdmin's Query Tool against the `retention_rfm` database. Each file does one job.

Naming rule: NN_what_it_does.sql

| Range | Purpose |
|---|---|
| 01-04 | Create table, load data, validate, data quality checks |
| 05-07 | Clean view (incl. date parsing), customer table, validation |
| 08-16 | Cohorts, cohort sizes, active months, month index, one-and-done vs repeat |
| 17-21 | Retention matrix, repurchase gap |
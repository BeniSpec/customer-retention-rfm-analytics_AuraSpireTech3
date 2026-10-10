-- 06_convert_dates.sql
-- Test: convert M/D/YYYY H:MM into YYYY-MM-DD HH:MM:SS
WITH a AS (SELECT *, substr(InvoiceDate,1,instr(InvoiceDate,'/')-1) AS m,
                     substr(InvoiceDate,instr(InvoiceDate,'/')+1) AS r1 FROM retail_dedup),
b AS (SELECT *, substr(r1,1,instr(r1,'/')-1) AS d,
                substr(r1,instr(r1,'/')+1) AS r2 FROM a),
c AS (SELECT *, substr(r2,1,4) AS y, trim(substr(r2,6)) AS t FROM b)
SELECT InvoiceDate AS original,
       printf('%s-%02d-%02d %02d:%02d:00', y, m, d,
              substr(t,1,instr(t,':')-1), substr(t,instr(t,':')+1)) AS converted
FROM c LIMIT 10;
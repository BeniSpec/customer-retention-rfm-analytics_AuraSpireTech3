SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;

-- 22_revenue_concentration.sql
-- Share of revenue by customer decile (decile 1 = top 10% of customers)
WITH ranked AS (
  SELECT customer_id, total_revenue,
         NTILE(10) OVER (ORDER BY total_revenue DESC) AS decile
  FROM customer_base)
SELECT decile, COUNT(*) AS customers,
       ROUND(SUM(total_revenue)::numeric,2) AS revenue,
       ROUND((100*SUM(total_revenue)/SUM(SUM(total_revenue)) OVER ())::numeric,2) AS pct_of_revenue,
       ROUND((100*SUM(SUM(total_revenue)) OVER (ORDER BY decile)
              /SUM(SUM(total_revenue)) OVER ())::numeric,2) AS cumulative_pct
FROM ranked GROUP BY decile ORDER BY decile;
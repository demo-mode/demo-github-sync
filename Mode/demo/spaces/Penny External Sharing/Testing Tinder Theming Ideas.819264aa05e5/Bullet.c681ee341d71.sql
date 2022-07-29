    SELECT r.name AS region,
           (SUM(CASE WHEN DATE_TRUNC('year',o.occurred_at) = '2014-01-01'::timestamp THEN o.total_amt_usd END)/100000)::integer AS sales_14,
           (SUM(CASE WHEN DATE_TRUNC('year',o.occurred_at) = '2015-01-01'::timestamp THEN o.total_amt_usd END)/100000)::integer AS sales_15,
           (SUM(CASE WHEN DATE_TRUNC('year',o.occurred_at) = '2016-01-01'::timestamp THEN o.total_amt_usd END)/100000)::integer AS sales_16,
           (2* SUM(CASE WHEN DATE_TRUNC('year',o.occurred_at) = '2015-01-01'::timestamp THEN o.total_amt_usd END)/100000)::integer AS goal,
           100 AS max
      FROM demo.accounts a
      JOIN demo.orders o
        ON o.account_id = a.id
       AND o.occurred_at < '2017-01-01'
      JOIN demo.sales_reps sr
        ON a.sales_rep_id = sr.id
      JOIN demo.region r
        ON sr.region_id = r.id
     GROUP BY 1
     ORDER BY 2
     
     
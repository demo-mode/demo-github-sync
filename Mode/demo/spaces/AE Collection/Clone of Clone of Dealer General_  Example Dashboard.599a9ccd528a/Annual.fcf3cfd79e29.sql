    SELECT DATE_TRUNC('month',o.occurred_at) + INTERVAL '1400 DAY' AS date,
           r.name,
           COUNT(DISTINCT o.account_id)+(random()*1000) AS customers,
           SUM(o.gloss_qty) AS gloss_units,
           SUM(o.poster_qty) AS poster_units,
           SUM(o.standard_qty) AS standard_units,
           SUM(o.total) AS total_units,
           SUM(o.total_amt_usd) AS total_sales_usd,
           (SUM(o.gloss_qty) + SUM(o.poster_qty)) / SUM(o.total)::float AS non_standard_sales
      FROM demo.orders o
      join demo.accounts a on a.id = o.account_id
      join demo.sales_reps sr on sr.id = a.sales_rep_id 
      join demo.region r on r.id = sr.region_id
      WHERE r.name in ({{region}})
      GROUP BY 1,2
      ORDER BY 1,2, 3, 4
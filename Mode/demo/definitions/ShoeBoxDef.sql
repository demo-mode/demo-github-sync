SELECT DATE_TRUNC('year',o.occurred_at) AS year,
           COUNT(DISTINCT o.account_id)*(100000)+(random()*100000) AS customers,
           SUM(o.gloss_qty) AS gloss_units,
           SUM(o.poster_qty) AS poster_units,
           SUM(o.standard_qty) AS standard_units,
           SUM(o.total) AS total_units,
           SUM(o.total_amt_usd) AS total_sales_usd,
           (SUM(o.gloss_qty) + SUM(o.poster_qty)) / SUM(o.total)::float AS non_standard_sales
      FROM demo.orders o
     WHERE o.occurred_at < '2017-01-01'
     GROUP BY 1
     ORDER BY 1

    SELECT DATE_TRUNC('month',o.occurred_at) AS date,
           SUM(o.gloss_qty) AS "gloss units",
           SUM(o.poster_qty) AS "poster units",
           SUM(o.standard_qty) AS "standard units",
           SUM(o.total_amt_usd) AS "total sales usd",
           (SUM(o.gloss_qty) + SUM(o.poster_qty)) / NULLIF(SUM(o.total),0)::float AS "non standard sales"
      FROM demo.orders o
     WHERE o.occurred_at < '2017-01-01'
     GROUP BY 1
     ORDER BY 1
     
    
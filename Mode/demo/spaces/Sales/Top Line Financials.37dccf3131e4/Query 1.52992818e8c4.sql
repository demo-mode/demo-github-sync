    SELECT DATE_TRUNC('month',o.occurred_at) AS time_range,
           'month' AS interval,
           r.name AS region,
           SUM(o.standard_qty) AS standard,
           SUM(o.poster_qty) AS poster,
           SUM(o.gloss_qty) AS gloss,
           SUM(o.total) AS total,
           SUM(o.total_amt_usd) AS total_amt_usd
      FROM demo.orders o
      JOIN demo.orders__fulfillments f
        ON f.order_id = o.id
      JOIN demo.accounts a
        ON o.account_id = a.id
      JOIN demo.sales_reps sr
        ON sr.id = a.sales_rep_id
      JOIN demo.region r
        ON r.id = sr.region_id
     GROUP BY 1,2,3
     
UNION ALL

    SELECT DATE_TRUNC('quarter',o.occurred_at) AS time_range,
           'quarter' AS interval,
           r.name AS region,
           SUM(o.standard_qty) AS standard,
           SUM(o.poster_qty) AS poster,
           SUM(o.gloss_qty) AS gloss,
           SUM(o.total) AS total,
           SUM(o.total_amt_usd) AS total_amt_usd
      FROM demo.orders o
      JOIN demo.orders__fulfillments f
        ON f.order_id = o.id
      JOIN demo.accounts a
        ON o.account_id = a.id
      JOIN demo.sales_reps sr
        ON sr.id = a.sales_rep_id
      JOIN demo.region r
        ON r.id = sr.region_id
     GROUP BY 1,2,3
     ORDER BY 1,3
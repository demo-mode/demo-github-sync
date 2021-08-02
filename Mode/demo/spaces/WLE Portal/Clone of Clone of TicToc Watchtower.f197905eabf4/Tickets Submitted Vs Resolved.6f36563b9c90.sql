    SELECT DATE_TRUNC('month',o.occurred_at) AS Time,
           'month' AS interval,
           a.name AS account,
           a.id AS account_id,
           SUM(o.standard_qty) AS "Tickets Submitted",
           SUM(o.poster_qty) AS poster,
           SUM(o.gloss_qty) AS "Tickets Resolved",
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
        where o.occurred_at < '01-01-2016'
     GROUP BY 1,2,3,4
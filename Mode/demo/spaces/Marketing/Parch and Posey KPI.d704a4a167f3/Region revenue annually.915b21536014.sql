    SELECT DATE_TRUNC('day',o.occurred_at) AS date,
           r.name AS region,
           we.channel,
           SUM(o.gloss_qty) AS gloss_units,
           SUM(o.poster_qty) AS poster_units,
           SUM(o.standard_qty) AS standard_units,
           SUM(o.total_amt_usd) AS total_sales_usd,
           (SUM(o.gloss_qty) + SUM(o.poster_qty)) / NULLIF(SUM(o.total),0)::float AS non_standard_sales
      FROM demo.accounts a
      JOIN demo.orders o
        ON o.account_id = a.id
       AND o.occurred_at >= '2016-01-01'
       AND o.occurred_at < '2017-01-01'
      JOIN demo.sales_reps sr
        ON a.sales_rep_id = sr.id
      JOIN demo.region r
        ON sr.region_id = r.id
      JOIN demo.web_events_new we
        ON we.account_id = o.account_id
       AND o.occurred_at BETWEEN we.occurred_at AND we.occurred_at + interval '31 minutes'
     GROUP BY 1,2,3
     ORDER BY 1
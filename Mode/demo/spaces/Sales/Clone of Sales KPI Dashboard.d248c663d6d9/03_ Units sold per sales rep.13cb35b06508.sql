SELECT r.name AS "Region",
       CASE WHEN o.id::INT % 5 = 1 THEN 'outbound' ELSE 'inbound' END AS "Order Type",
       SUM(o.standard_qty) AS "Standard Sales",
       sum(o.poster_qty) AS "Non Standard Sales",
       sum(total) AS "total Sales",
       sum(gloss_qty) as "Missed Sales"
  FROM demo.orders o
  JOIN demo.accounts a
    ON a.id = o.account_id
  JOIN demo.sales_reps s
    ON s.id = a.sales_rep_id
  JOIN demo.region r
    ON r.id = s.region_id
 WHERE o.occurred_at >= '2014-01-01'
   AND o.occurred_at <  '2017-01-01'
 GROUP BY 1,2
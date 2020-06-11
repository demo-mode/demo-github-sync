SELECT s.name AS "Rep",
       a.name AS "Account",
       SUM(o.standard_qty) AS "Amount"
  FROM demo.orders o
  JOIN demo.accounts a
    ON a.id = o.account_id
  JOIN demo.sales_reps s
    ON s.id = a.sales_rep_id
  JOIN demo.region r
    ON r.id = s.region_id
 WHERE o.occurred_at >= '2014-01-01'
   AND o.occurred_at <  '2017-01-01'
   AND r.name = 'Southeast'
   AND ((o.id::INT % 5 = 1 AND 'inbound' = 'outbound') 
    OR  (o.id::INT % 5 != 1 AND 'inbound' = 'inbound'))
 GROUP BY 1,2
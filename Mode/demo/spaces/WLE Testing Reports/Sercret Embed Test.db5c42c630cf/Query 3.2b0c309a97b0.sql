    SELECT r.name as region,
           SUM(o.total) / COUNT(sr.id) as units_sold_per_rep
      FROM demo.orders o
      JOIN demo.accounts a
        ON a.id = o.account_id
      JOIN demo.sales_reps sr
        ON sr.id = a.sales_rep_id
      JOIN demo.region r
        ON sr.region_id = r.id
     WHERE o.occurred_at BETWEEN '2016-01-01' AND '2016-12-31 23:59:59'
  GROUP BY 1
  ORDER BY 2 DESC
     
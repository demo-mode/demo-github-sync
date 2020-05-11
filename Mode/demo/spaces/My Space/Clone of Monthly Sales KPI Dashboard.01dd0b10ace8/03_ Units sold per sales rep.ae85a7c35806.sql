    SELECT r.name as region,
           SUM(o.total) / COUNT(sr.id) as units_sold_per_rep
      FROM demo.orders o
      JOIN demo.accounts a
        ON a.id = o.account_id
      JOIN demo.sales_reps sr
        ON sr.id = a.sales_rep_id
      JOIN demo.region r
        ON sr.region_id = r.id
  GROUP BY 1
  ORDER BY 2 DESC
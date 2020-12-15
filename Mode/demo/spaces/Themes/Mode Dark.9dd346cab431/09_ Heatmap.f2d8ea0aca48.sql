    SELECT a.lat,
           a.long,
           SUM(total)as total
      FROM demo.accounts a
      JOIN demo.orders o
        ON a.id = o.account_id
      JOIN demo.sales_reps sr
        ON a.sales_rep_id = sr.id
      JOIN demo.region r
        ON sr.region_id = r.id
  GROUP BY 1,2
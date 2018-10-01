    SELECT TO_CHAR(o.occurred_at,'MM-Month')as month,
           r.name as region,
           ( SUM(o.total_amt_usd) / COUNT(DISTINCT sr.id) ) / 1000 as rev_per_rep_k
      FROM demo.orders o
      JOIN demo.accounts a
        ON o.account_id = a.id
      JOIN demo.sales_reps sr
        ON a.sales_rep_id = sr.id
      JOIN demo.region r
        ON sr.region_id = r.id
     WHERE o.occurred_at BETWEEN '2015-01-01' AND '2015-12-31 23:59:59'
  GROUP BY 1,2
  ORDER BY 1
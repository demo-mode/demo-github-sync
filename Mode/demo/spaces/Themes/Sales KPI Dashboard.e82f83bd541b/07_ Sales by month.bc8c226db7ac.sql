    SELECT TO_CHAR(occurred_at,'MM')as month_number,
           TO_CHAR(occurred_at,'MON')as month,
           SUM(total) as units_sold,
           SUM(total_amt_usd)as revenue
      FROM demo.orders
     WHERE occurred_at BETWEEN '2016-01-01' AND '2016-12-31 23:59:59'
  GROUP BY 1,2
  ORDER BY 1
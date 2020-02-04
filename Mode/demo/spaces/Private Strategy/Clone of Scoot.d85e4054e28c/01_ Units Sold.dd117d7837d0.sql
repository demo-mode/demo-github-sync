    SELECT TO_CHAR(occurred_at,'YYYY')as year,
           SUM(total) as reams_sold
      FROM demo.orders
     WHERE occurred_at BETWEEN '2015-01-01' AND '2016-12-31 23:59:59'
  GROUP BY 1
  ORDER BY 1 DESC
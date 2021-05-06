-- Returns first 100 rows from demo.web_events_full
SELECT * FROM demo.web_events_full LIMIT 100;


    SELECT TO_CHAR(occurred_at,'YYYY')as year,
           SUM(total) as reams_sold
      FROM demo.orders
     WHERE occurred_at BETWEEN '2015-01-02' AND '2016-12-31 23:59:59'
  GROUP BY 1
  ORDER BY 1 ASC
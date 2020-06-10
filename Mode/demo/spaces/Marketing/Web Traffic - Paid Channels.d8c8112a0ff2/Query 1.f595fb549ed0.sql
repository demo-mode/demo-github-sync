SELECT TO_CHAR(DATE_TRUNC('month',occurred_at),'YYYY-MM-DD')as month,
       channel,
       COUNT(*)
    FROM demo.web_events
    WHERE occurred_at < '2016-07-01'
  GROUP BY 1,2
  ORDER BY 1,3 DESC
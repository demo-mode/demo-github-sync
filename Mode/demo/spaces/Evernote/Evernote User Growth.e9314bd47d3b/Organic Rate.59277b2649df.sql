    SELECT day,
           organic_rate AS "Organic Rate",
           AVG(organic_rate) OVER (ORDER BY day ROWS BETWEEN 6 PRECEDING AND 0 FOLLOWING) AS "Rolling 7 Day Avg"
      FROM (
    SELECT DATE_TRUNC('day',occurred_at) AS day,
           COUNT(CASE WHEN event_name = 'Organic' THEN 1 ELSE NULL END) / COUNT(*)::float AS organic_rate
      FROM modeanalytics.dimension_orders 
     WHERE occurred_at < '2014-05-31'
     GROUP BY 1
           ) sub
     ORDER BY 1
     
     
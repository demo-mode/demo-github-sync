    SELECT DATE_TRUNC('day',occurred_at) AS day,
           region,
           event_name AS channel,
           COUNT(*) AS orders
      FROM modeanalytics.dimension_orders 
     WHERE occurred_at < '2014-05-31'
     GROUP BY 1,2,3
     ORDER BY 1,2,3
     
     
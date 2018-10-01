    SELECT *,
           CASE WHEN churned = 1 THEN 'red'
                ELSE 'green' END AS color
                
    FROM(
    
    SELECT *
      FROM modeanalytics.load_time
      ) a
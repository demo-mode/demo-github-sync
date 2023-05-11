SELECT day + INTERVAL '1400 DAYS' AS day,

           orders,

           rolling_avg

      FROM (

    SELECT DATE_TRUNC('day',occurred_at) AS day,

           COUNT(*) AS orders,

           AVG(COUNT(*)) OVER (ORDER BY DATE_TRUNC('day',occurred_at) ROWS BETWEEN 6 PRECEDING AND 0 FOLLOWING) AS rolling_avg

      FROM modeanalytics.dimension_orders 

     WHERE occurred_at < '2014-05-31'

     GROUP BY 1

           ) o

     ORDER BY 1
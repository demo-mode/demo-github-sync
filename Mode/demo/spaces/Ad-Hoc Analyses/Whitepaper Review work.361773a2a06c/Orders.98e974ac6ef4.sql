WITH

  original_query as (
    SELECT day + INTERVAL '946 DAYS' AS day,
           orders,
           rolling_avg,
           LAG(rolling_avg, 7) OVER(ORDER BY day + INTERVAL '946 DAYS') as rolling_avg_7d_ago,
           COALESCE((rolling_avg - LAG(rolling_avg, 7) OVER(ORDER BY day + INTERVAL '946 DAYS')), 0) as rolling_avg_7d_ago_diff
      FROM (
    SELECT DATE_TRUNC('day',occurred_at) AS day,
           COUNT(*) AS orders,
           AVG(COUNT(*)) OVER (ORDER BY DATE_TRUNC('day',occurred_at) ROWS BETWEEN 6 PRECEDING AND 0 FOLLOWING) AS rolling_avg
      FROM modeanalytics.dimension_orders 
     WHERE occurred_at < '2014-05-31'
     GROUP BY 1
           ) o
  )

SELECT day,
       orders,
       rolling_avg,
       rolling_avg_7d_ago_diff / rolling_avg_7d_ago as rolling_avg_7d_ago_percent_diff
  FROM original_query
 ORDER BY 1
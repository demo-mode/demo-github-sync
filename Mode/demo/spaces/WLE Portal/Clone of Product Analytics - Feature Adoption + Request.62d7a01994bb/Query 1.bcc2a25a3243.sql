WITH 
  funnel AS (
    SELECT CASE 
                WHEN event_name = 'create_user' THEN '1. Create user'
                WHEN event_name = 'login' THEN '2. Login'
                WHEN event_name = 'like_message' THEN '3. Like message'
                WHEN event_name = 'send_message' THEN '4. Send message'
                WHEN event_name = 'upload_picture' THEN '5. Upload picture'
                ELSE event_name
            END AS event,
         COUNT(DISTINCT u.user_id) AS retained
    FROM johnny_kelley.product_analytics_subscriptions s
    JOIN johnny_kelley.product_analytics_users u
    ON s.company_id = u.company_id 
    JOIN johnny_kelley.product_analytics_events e
    ON e.user_id = u.user_id
    GROUP BY 1
  )
  
    SELECT *,
           LAG(retained,1) OVER () AS previous_step
      FROM funnel
     ORDER BY 1
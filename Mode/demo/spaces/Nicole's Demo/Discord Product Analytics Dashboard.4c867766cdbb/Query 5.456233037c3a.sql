SELECT CASE 
            WHEN event_name = 'create_user' THEN '1. Create user'
            WHEN event_name = 'login' THEN '2. Login'
            WHEN event_name = 'like_message' THEN '3. Like message'
            WHEN event_name = 'send_message' THEN '4. Send message'
            WHEN event_name = 'upload_picture' THEN '5. Upload picture'
            ELSE event_name
       END AS event,
       *
  FROM johnny_kelley.product_analytics_events e
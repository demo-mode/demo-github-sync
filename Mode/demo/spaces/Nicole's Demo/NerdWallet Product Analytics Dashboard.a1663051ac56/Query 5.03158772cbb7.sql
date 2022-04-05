SELECT CASE 
            WHEN event_name = 'create_user' THEN '1. Login'
            WHEN event_name = 'login' THEN '2. Create Text Channel'
            WHEN event_name = 'like_message' THEN '3. Send Text in Channel'
            WHEN event_name = 'send_message' THEN '4. Create Voice Channel'
            WHEN event_name = 'upload_picture' THEN '5. Start Video'
            ELSE event_name
       END AS event,
       *
  FROM johnny_kelley.product_analytics_events e
SELECT s.company_id as company_id,
       u.user_id as user_id,
       e.occurred_at as occured_at,
       e.event_name as event_name
FROM johnny_kelley.product_analytics_subscriptions s
JOIN johnny_kelley.product_analytics_users u
ON s.company_id = u.company_id 
JOIN johnny_kelley.product_analytics_events e
ON e.user_id = u.user_id
WHERE event_name = 'login';

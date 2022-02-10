SELECT *
FROM johnny_kelley.product_analytics_users u
JOIN johnny_kelley.product_analytics_events e
ON u.user_id = e.user_id
JOIN johnny_kelley.product_analytics_subscriptions s
ON s.company_id = u.company_id;

SELECT date_trunc('WEEK', occurred_at) AS WEEK,
COUNT(s.company_id) as count_company_id
FROM johnny_kelley.product_analytics_users u 
JOIN johnny_kelley.product_analytics_events e 
ON u.user_id = e.user_id 
JOIN johnny_kelley.product_analytics_subscriptions s 
ON s.company_id = u.company_id
WHERE e.event_name = 'upload_picture'
AND s.signed_date < '2020-05-01'
AND occurred_at < '2020-09-14'
GROUP BY 1
ORDER BY 1
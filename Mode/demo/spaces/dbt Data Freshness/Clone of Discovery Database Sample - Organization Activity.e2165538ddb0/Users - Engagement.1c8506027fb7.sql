SELECT DATE_TRUNC('day',last_engaged_date_utc) AS day, id AS user_id, membership_type
FROM /*mode.*/organization_usage.users u 
WHERE membership_state = 'active'
AND last_engaged_date_utc IS NOT NULL 
SELECT DATE_TRUNC('day',membership_started_at_utc) AS day, id AS user_id, membership_type, membership_state
FROM /*mode.*/organization_usage.users u 

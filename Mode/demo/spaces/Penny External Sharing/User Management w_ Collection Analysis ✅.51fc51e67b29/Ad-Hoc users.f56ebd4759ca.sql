WITH

  report_views AS (
    SELECT rv.viewer_id,
           COUNT(rv.report_id) AS report_views,
           COUNT(DISTINCT rv.report_id) AS reports_viewed
      FROM /*mode.*/organization_usage.report_views rv
     WHERE rv.viewed_at_utc >= NOW() - INTERVAL '200 DAY'
     GROUP BY 1
  ), 
  
  reports AS (
    SELECT r.creator_id,
           COUNT(r.id) AS reports_created,
           COUNT(CASE WHEN r.state = 'active' THEN r.id ELSE NULL END) AS reports_created_active,
           COUNT(CASE WHEN r.collection_type = 'Open' THEN r.id ELSE NULL END) AS reports_created_in_open_spaces,
           COUNT(CASE WHEN r.collection_type = 'Private' THEN r.id ELSE NULL END) AS reports_created_in_private_spaces, 
           COUNT(CASE WHEN r.collection_type = 'Personal' THEN r.id ELSE NULL END) AS reports_created_in_personal_space,
           MAX(r.created_at_utc) AS last_report_created_at_utc
      FROM /*mode.*/organization_usage.reports r
     GROUP BY 1
  ), 
  
  queries AS (
    SELECT q.creator_id,
           COUNT(q.id) AS queries_created    
           FROM /*mode.*/organization_usage.queries q
     GROUP BY 1
  ),
  
  query_runs AS (
    SELECT qr.runner_id,
           COUNT(qr.id) AS query_runs_over_last_90_days 
           FROM /*mode.*/organization_usage.query_runs qr 
           WHERE qr.started_at_utc >= CURRENT_DATE - INTERVAL '90 DAYS'
     GROUP BY 1
  )
  
  SELECT u.email AS "user_email",
         u.username AS "username",
         u.membership_started_at_utc AS "membership_started_at_utc",
         u.membership_state AS "membership_state",
         u.membership_type AS "membership_type",
         u.last_engaged_date_utc AS "last_engaged_date_utc",
         COALESCE(reports_created,0) AS "reports_created", 
         COALESCE(reports_created_in_open_spaces,0) AS "reports_created_in_open_spaces",
         COALESCE(reports_created_in_private_spaces,0) AS "reports_created_in_private_spaces", 
         COALESCE(reports_created_in_personal_space,0) AS "reports_created_in_personal_space",
         COALESCE(queries_created,0) AS "queries_created",
         COALESCE(query_runs_over_last_90_days,0) AS "query_runs_over_last_90_days",
         COALESCE(report_views,0) AS "report_views_over_last_90_days",
         COALESCE(reports_viewed,0) AS "reports_viewed_over_last_90_days"
  FROM /*mode.*/organization_usage.users u 
  LEFT JOIN reports r
    ON r.creator_id = u.id
  LEFT JOIN queries q
    ON q.creator_id = u.id
  LEFT JOIN query_runs qr 
    ON qr.runner_id = u.id
  LEFT JOIN report_views rv
    ON rv.viewer_id = u.id
  WHERE u.membership_state = 'active'
  ORDER BY 9
  

SELECT
  r.name AS report_name,
  r.description AS report_description,
  state,
  creator_email,
  r.created_at_utc report_created,
  collection_name,
  viewer_id,
  viewed_at_utc,
  view_location, 
  rv.id as view_id
FROM
  organization_usage.reports r
  JOIN organization_usage.report_views rv ON r.id = rv.report_id
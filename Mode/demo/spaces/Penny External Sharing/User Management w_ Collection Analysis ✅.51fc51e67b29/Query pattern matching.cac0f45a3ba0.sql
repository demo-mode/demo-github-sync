-- Returns first 100 rows from organization_usage.queries
SELECT
  q.name query_name,
  q.report_id,
  q.creator_id,
  q.connection_name,
  q.query
FROM
  organization_usage.queries q

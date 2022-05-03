-- Returns first 100 rows from organization_usage.reports
SELECT
  *
FROM
  organization_usage.reports r
  JOIN organization_usage.report_views rv ON r.id = rv.report_id

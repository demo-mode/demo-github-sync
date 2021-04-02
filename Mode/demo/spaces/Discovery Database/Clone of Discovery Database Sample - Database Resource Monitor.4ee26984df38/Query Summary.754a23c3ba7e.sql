/* ##################INSTRUCTIONS TO ENABLE QUERY TO RUN ON DISCOVERY DATABASE ##############################
*
*Because the Mode Public Warehouse runs on a postgreSQL database, we need to make a few changes to the syntax so the query can successfully run on the Discovery Database,
*which is provided through Snowflake.
*
*Please make the following changes
*1. Switch to your Discovery Database connection
*2. Remove the comments around "mode."
*3. Replace "NOW()" with CURRENT_TIMESTAMP

*/

WITH 
  views AS (
    SELECT rv.report_id,
           COUNT(rv.report_id) AS views,
           COUNT(DISTINCT rv.viewer_id) AS viewers
      FROM /*mode.*/organization_usage.report_views rv
     WHERE rv.viewed_at_utc >= NOW() - INTERVAL '90 DAY'
     GROUP BY 1
  )

SELECT r.name AS "report_name",
       q.name AS "query_name",
       q.id AS "query_id",
       q.url AS "query_url",
       u.email AS "creator_email",
       COALESCE(v.views,0) AS "report_views_over_last_90_days",
       COALESCE(v.viewers,0) AS "report_viewers_over_last_90_days",
       COUNT(qr.id) AS "query_runs",
       SUM(qr.runtime_in_seconds) AS "cumulative_runtime",
       MAX(qr.runtime_in_seconds) AS "longest_run",
       AVG(qr.runtime_in_seconds) AS "average_runtime_per_run"
  FROM /*mode.*/organization_usage.reports r
  JOIN /*mode.*/organization_usage.queries q
    ON q.report_id = r.id
  JOIN /*mode.*/organization_usage.users u
    ON u.id = q.creator_id
  JOIN /*mode.*/organization_usage.query_runs qr
    ON qr.query_id = q.id
   AND qr.state = 'succeeded'
   AND qr.started_at_utc >= NOW() - INTERVAL '90 DAY'
  LEFT JOIN views v
    ON v.report_id = r.id
 GROUP BY 1,2,3,4,5,6,7
 ORDER BY 11 DESC
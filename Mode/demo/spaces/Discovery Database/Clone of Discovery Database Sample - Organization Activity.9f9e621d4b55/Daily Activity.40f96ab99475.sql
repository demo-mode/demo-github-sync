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
  report_views AS (
    SELECT DATE_TRUNC('day',rv.viewed_at_utc) AS day,
           COUNT(rv.report_id) AS report_views,
           COUNT(DISTINCT rv.viewer_id) AS viewers,
           COUNT(DISTINCT rv.report_id) AS reports_viewed
      FROM /*mode.*/organization_usage.report_views rv
     WHERE rv.viewed_at_utc >= NOW() - INTERVAL '90 DAY'
     GROUP BY 1
  ),

  reports AS (
    SELECT DATE_TRUNC('day',r.created_at_utc) AS day,
           COUNT(r.id) AS reports_created,
           COUNT(DISTINCT r.creator_id) AS report_creators
      FROM /*mode.*/organization_usage.reports r
     WHERE r.created_at_utc >= NOW() - INTERVAL '90 DAY'
     GROUP BY 1
  ),
  
  query_runs AS (
    SELECT DATE_TRUNC('day',qr.started_at_utc) AS day,
           COUNT(qr.id) AS query_runs,
           COUNT(CASE WHEN qr.is_scheduled = TRUE THEN qr.query_id ELSE NULL END) AS scheduled_query_runs,
           COUNT(CASE WHEN qr.is_scheduled = FALSE THEN qr.query_id ELSE NULL END) AS unscheduled_query_runs,
           COUNT(DISTINCT qr.runner_id) AS query_runners
      FROM /*mode.*/organization_usage.query_runs qr
     WHERE qr.started_at_utc >= NOW() - INTERVAL '90 DAY'
     GROUP BY 1
  ),

  visualizations AS (
    SELECT DATE_TRUNC('day',v.created_at_utc) AS day,
           COUNT(v.id) AS visualizations_created,
           COUNT(CASE WHEN v.is_saved_exploration = TRUE THEN v.id ELSE NULL END) AS explorations_created
      FROM /*mode.*/organization_usage.visualizations v
     WHERE v.created_at_utc >= NOW() - INTERVAL '90 DAY'
     GROUP BY 1
  )
  
    SELECT rv.day,
           COALESCE(rv.report_views,0) AS "report_views",
           COALESCE(rv.viewers,0) AS "viewers",
           COALESCE(rv.reports_viewed,0) AS "reports_viewed",
           COALESCE(r.reports_created,0) AS "reports_created",
           COALESCE(r.report_creators,0) AS "report_creators",
           COALESCE(qr.query_runs,0) AS "query_runs",
           COALESCE(qr.scheduled_query_runs,0) AS "scheduled_query_runs",
           COALESCE(qr.unscheduled_query_runs,0) AS "unscheduled_query_runs",
           COALESCE(v.visualizations_created,0) AS "visualizations_created",
           COALESCE(v.explorations_created,0) AS "explorations_created"
      FROM report_views rv
      LEFT JOIN reports r
        ON r.day = rv.day
      LEFT JOIN query_runs qr
        ON qr.day = rv.day
      LEFT JOIN visualizations v
        ON v.day = rv.day
     ORDER BY 1
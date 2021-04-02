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
  daily_query_runs AS (
    SELECT DATE_TRUNC('day',qr.started_at_utc) AS day,
           u.username as query_runner,
           CASE WHEN qr.is_scheduled THEN 'Yes' ELSE 'No' END as is_scheduled,
           q.id as query_id,
           q.name as query_name,
           q.url as query_url,
           r.id as report_id,
           r.name as report_name,
           r.collection_name,
           COUNT(qr.id) AS query_runs,
           COUNT(CASE WHEN qr.state = 'failed' THEN qr.id ELSE NULL END) AS total_runs_failed,
           COUNT(CASE WHEN qr.state = 'failed' THEN qr.id ELSE NULL END)/COUNT(qr.id)::FLOAT AS percent_of_runs_failed,
           COUNT(DISTINCT qr.runner_id) AS query_runners,
           SUM(CASE WHEN qr.state = 'succeeded' THEN qr.runtime_in_seconds ELSE NULL END)/60 AS total_runtime_in_minutes,
           AVG(CASE WHEN qr.state = 'succeeded' THEN qr.runtime_in_seconds ELSE NULL END) AS avg_runtime_in_seconds,
           SUM(qr.rows_returned) AS total_rows_returns
      FROM /*mode.*/organization_usage.query_runs qr
      JOIN /*mode.*/organization_usage.queries q
        ON q.id = qr.query_id
      JOIN /*mode.*/organization_usage.reports r
        ON r.id = q.report_id
      JOIN /*mode.*/organization_usage.users u
        ON u.id = qr.runner_id 
     WHERE qr.started_at_utc >= NOW() - INTERVAL '90 DAY'
     GROUP BY 1,2,3,4,5,6,7,8,9
     ORDER BY 1,2,3,4,5,6,7,8,9
  ),
  
  by_runner AS (
    SELECT q.query_runner,
           COALESCE(ROUND(SUM(query_runs)::numeric ,2),0) as runner_total_query_runs,
           COALESCE(ROUND(SUM(total_runtime_in_minutes)::numeric ,2),0) as runner_total_runtime_in_minutes,
           ROW_NUMBER() OVER(ORDER BY COALESCE(ROUND(SUM(query_runs)::numeric ,2),0) DESC) as runner_total_query_runs_rank,
           ROW_NUMBER() OVER(ORDER BY COALESCE(ROUND(SUM(total_runtime_in_minutes)::numeric ,2),0) DESC) as runner_total_runtime_in_minutes_rank
      FROM daily_query_runs q
      GROUP BY 1
  ),
  
  by_report AS (
    SELECT q.report_id,
           COALESCE(ROUND(SUM(query_runs)::numeric ,2),0) as report_total_query_runs,
           COALESCE(ROUND(SUM(total_runtime_in_minutes)::numeric ,2),0) as report_total_runtime_in_minutes,
           RANK() OVER(ORDER BY COALESCE(ROUND(SUM(query_runs)::numeric ,2),0) DESC) as report_total_query_runs_rank,
           RANK() OVER(ORDER BY COALESCE(ROUND(SUM(total_runtime_in_minutes)::numeric ,2),0) DESC) as report_total_runtime_in_minutes_rank
      FROM daily_query_runs q
      GROUP BY 1
  ),
  
  by_query AS (
    SELECT q.query_id,
           COALESCE(ROUND(SUM(total_runs_failed)::numeric ,2),0) as query_total_runs_failed,
           COALESCE(ROUND(SUM(query_runs)::numeric ,2),0) as query_total_runs,
           COALESCE(ROUND(SUM(total_runtime_in_minutes)::numeric ,2),0) as query_total_runtime_in_minutes,
           RANK() OVER(ORDER BY COALESCE(ROUND(SUM(total_runs_failed)::numeric ,2),0) DESC) as query_total_runs_failed_rank,
           RANK() OVER(ORDER BY COALESCE(ROUND(SUM(query_runs)::numeric ,2),0) DESC) as query_total_runs_rank,
           RANK() OVER(ORDER BY COALESCE(ROUND(SUM(total_runtime_in_minutes)::numeric ,2),0) DESC) as query_total_runtime_in_minutes_rank
      FROM daily_query_runs q
      GROUP BY 1
  )
  
  SELECT d.day AS "day",
         d.query_runner AS "query_runner",
         d.is_scheduled AS "is_scheduled",
         d.query_id AS "query_id",
         d.query_name AS "query_name",
         d.query_url AS "query_url",
         d.report_id AS "report_id",
         d.report_name AS "report_name",
         d.collection_name AS "collection_name",
         d.query_runs AS "query_runs",
         d.total_runs_failed AS "total_runs_failed",
         d.percent_of_runs_failed AS "percent_of_runs_failed",
         d.query_runners AS "query_runners",
         d.total_runtime_in_minutes AS "total_runtime_in_minutes",
         d.avg_runtime_in_seconds AS "avg_runtime_in_seconds",
         d.total_rows_returns AS "total_rows_returns",
         runner_total_query_runs_rank AS "runner_total_query_runs_rank",
         runner_total_runtime_in_minutes_rank AS "runner_total_runtime_in_minutes_rank",
         report_total_query_runs_rank AS "report_total_query_runs_rank",
         report_total_runtime_in_minutes_rank AS "report_total_runtime_in_minutes_rank",
         query_total_runs_failed_rank AS "query_total_runs_failed_rank",
         query_total_runs_rank AS "query_total_runs_rank",
         query_total_runtime_in_minutes_rank AS "query_total_runtime_in_minutes_rank"
    FROM daily_query_runs d
    JOIN by_runner r 
      ON r.query_runner = d.query_runner
    JOIN by_report rp 
      ON rp.report_id = d.report_id
    JOIN by_query q 
      ON q.query_id = d.query_id
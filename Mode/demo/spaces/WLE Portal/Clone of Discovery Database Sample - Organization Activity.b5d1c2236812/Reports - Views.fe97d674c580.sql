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
  reports AS ( 
    SELECT id AS report_id,
           name AS report_name, 
           description AS report_desc, 
           collection_name AS report_collection_name
      FROM /*mode.*/organization_usage.reports
  ), 

  report_views AS (
    SELECT DATE_TRUNC('day', viewed_at_utc) AS day,
            report_id, 
            COUNT(DISTINCT id) n_report_views
      FROM /*mode.*/organization_usage.report_views rv
     GROUP BY 1,2
  ) 


  SELECT day AS "day", 
         report_views.report_id AS "report_id", 
         report_name AS "report_name", 
         report_desc AS "report_desc", 
         report_collection_name AS "report_collection_name", 
         n_report_views AS "n_report_views"
  FROM reports
  INNER JOIN report_views 
  ON reports.report_id = report_views.report_id

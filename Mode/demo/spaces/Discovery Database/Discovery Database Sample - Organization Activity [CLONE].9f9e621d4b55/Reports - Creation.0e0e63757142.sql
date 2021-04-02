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

SELECT id AS "report_id",
       name AS "report_name", 
       description AS "report_desc", 
       collection_name AS "report_collection_name", 
       DATE_TRUNC('day',created_at_utc) AS "day"
  FROM /*mode.*/organization_usage.reports



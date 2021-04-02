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
SELECT DATE_TRUNC('day',last_engaged_date_utc) AS "day", 
       id AS "user_id", 
       membership_type AS "membership_type"
  FROM /*mode.*/organization_usage.users u 
 WHERE membership_state = 'active'
   AND last_engaged_date_utc IS NOT NULL 
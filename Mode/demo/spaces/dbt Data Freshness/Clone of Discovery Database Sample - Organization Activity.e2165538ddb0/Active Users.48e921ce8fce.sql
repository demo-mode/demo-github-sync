/* ##################INSTRUCTIONS TO ENABLE QUERY TO RUN ON DISCOVERY DATABASE ##############################
*
*Because the Mode Public Warehouse runs on a postgreSQL database, we need to make a few changes to the syntax so the query can successfully run on the Discovery Database,
*which is provided through Snowflake.
*
*Please make the following changes
*1. Switch to your Discovery Database connection
*2. Remove the comments around "mode."
*3. Replace "NOW()" with CURRENT_TIMESTAMP
*4. Comment out the first CTE days, and uncomment the CTE that is currently commented out

*/


with 

days AS (
  SELECT 
    date_trunc('day', dd):: date AS day
  FROM generate_series
          ( '2020-08-31'::timestamp 
          , '2021-08-31'::timestamp
          , '1 day'::interval) dd
)
/*
days AS (
select
  dateadd(
    day,
    '-' || row_number() over (order by null),
    dateadd(day, '+1', current_date())
  ) as date
from table (generator(rowcount => 365))
)
*/
 
 SELECT 
  d.day,
  COUNT(*) AS active_users
 FROM days d 
 LEFT JOIN /*MODE.*/ORGANIZATION_USAGE.USERS u 
  ON DATE(u.MEMBERSHIP_STARTED_AT_UTC) <= d.day
    AND (DATE(u.MEMBERSHIP_ENDED_AT_UTC) >= d.day OR u.MEMBERSHIP_ENDED_AT_UTC is NULL)
  GROUP BY 1
  ORDER BY 1

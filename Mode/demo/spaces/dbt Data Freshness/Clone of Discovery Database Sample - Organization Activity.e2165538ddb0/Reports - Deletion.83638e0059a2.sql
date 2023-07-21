SELECT id AS report_id,
       name AS report_name, 
       description AS report_desc, 
       collection_name AS report_collection_name, 
       DATE_TRUNC('day',deleted_at_utc) AS day
FROM /*mode.*/organization_usage.reports
WHERE deleted_at_utc IS NOT NULL 
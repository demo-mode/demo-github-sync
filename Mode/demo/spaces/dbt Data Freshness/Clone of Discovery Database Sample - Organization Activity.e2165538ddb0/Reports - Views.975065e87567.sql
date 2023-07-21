WITH reports AS ( 
SELECT id AS report_id,
       name AS report_name, 
       description AS report_desc, 
       collection_name AS report_collection_name
FROM /*mode.*/organization_usage.reports) 

, report_views AS (
SELECT DATE_TRUNC('day', viewed_at_utc) AS day,
        report_id, 
        COUNT(DISTINCT id) n_report_views
FROM /*mode.*/organization_usage.report_views rv
GROUP BY 1,2
) 


SELECT day, report_views.report_id, report_name, report_desc, report_collection_name, n_report_views 
FROM reports
INNER JOIN report_views 
ON reports.report_id = report_views.report_id

WITH CTE AS
(
SELECT
DATE(qr.started_at_utc) AS day,
u.name AS query_runner_name,
u.id,
r.name AS report_name,
r.collection_name,
COALESCE(SUM(qr.bytes) / (1000 * 1000 * 1000), 0) AS data_usage_gb,
COUNT(qr.id) AS successful_query_runs
FROM organization_usage.query_runs qr
LEFT JOIN organization_usage.users u
ON u.id = qr.runner_id
LEFT JOIN organization_usage.queries q
ON q.id = qr.query_id
LEFT JOIN organization_usage.reports r
ON r.id = q.report_id
LEFT JOIN ORGANIZATION_USAGE.REPORT_SCHEDULES rs
ON rs.REPORT_ID = r.id
WHERE qr.state = 'succeeded' 
-- and day = DATEADD(dd,-1,CURRENT_DATE) 
and qr.IS_SCHEDULED = false
GROUP BY 1,2,3,4,5
-- GROUP BY 1
ORDER BY day desc,data_usage_gb desc
)

SELECT
sum(data_usage_gb)
FROM CTE





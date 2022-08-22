WITH CTE as (SELECT
DATE(qr.started_at_utc) AS day,
COALESCE(SUM(qr.bytes) / (1000 * 1000 * 1000), 0) AS data_usage_gb
FROM organization_usage.query_runs qr
WHERE qr.state = 'succeeded'
--and day = DATEADD(dd,-1, CURRENT_DATE) 
and qr.IS_SCHEDULED = false
GROUP BY 1
ORDER BY day desc,data_usage_gb desc
)
SELECT
sum(data_usage_gb)
FROM CTE
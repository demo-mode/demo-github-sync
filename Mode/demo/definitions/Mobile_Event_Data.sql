SELECT date_trunc('day',occurred_at) AS day,
       count(*) AS metric
FROM benn.fake_fact_events
WHERE occurred_at < '2014-06-01'
GROUP BY 1
ORDER BY 1
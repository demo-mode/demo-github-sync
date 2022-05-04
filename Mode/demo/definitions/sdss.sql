SELECT *,
       sub.calc_date_no_use + 1900 AS date
       

    FROM (
    SELECT 
r.name  AS region,
we.channel AS channel,
SUM(o.gloss_qty) AS gloss_units,
SUM(o.poster_qty) AS porter_units,
SUM(o.standard_qty) AS standard_units,
SUM((o.total_amt_usd)*100) AS total_sales_usd,
to_date(cast(o.occurred_at as TEXT),'YYYY-MM-DD') AS calc_date_no_use
FROM demo.accounts a
JOIN demo.orders o
ON o.account_id = a.id
AND o.occurred_at < '2017-01-01'
JOIN demo.sales_reps sr
ON a.sales_rep_id = sr.id
JOIN demo.region r
ON sr.region_id = r.id
JOIN demo.web_events_new we
ON we.account_id = o.account_id
AND o.occurred_at BETWEEN we.occurred_at AND we.occurred_at + interval '31 minutes'
GROUP BY 1,2,o.occurred_at
ORDER BY 1

) sub
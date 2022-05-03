SELECT *,
       sub.calc_date_no_use + 1900 AS date
       

    FROM (
    SELECT 
REPLACE(REPLACE(REPLACE(REPLACE(r.name, 'Midwest', 'City_Municipalities'),'West', 'Commercial_Business'),'Northeast', 'Events'),'Southeast', 'Test') AS "Parking Type",
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(we.channel, 'twitter', 'Japantown'),
'linkedin', 'Outer Richmond'), 'adroll', 'Laurel Heights'), 'adwords', 'Outer Sunset'), 'email', 'Southpark-Giants Field'), 'direct', 'Mission Bay'), 'facebook', 'Balboa Park'), 'banner', 'Oceanview'), 'organic', 'Sunnyside') AS Townships,
SUM(o.gloss_qty) AS "Under_An_Hour_Parking",
SUM(o.poster_qty) AS "Single_Hour_Parking",
SUM(o.standard_qty) AS "Multi_Hour_Parking",
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
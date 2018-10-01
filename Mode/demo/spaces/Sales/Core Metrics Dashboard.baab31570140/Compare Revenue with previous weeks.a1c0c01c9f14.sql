select *, AVG(x.total_amount)
OVER(ORDER BY x.date ROWS BETWEEN 100 PRECEDING AND 50 following) AS total_sales
from 
(
SELECT DATE_TRUNC('day',o.occurred_at) + interval '2 year' AS date,
o.total_amt_usd as total_amount,
r.name AS region
FROM demo.accounts a
JOIN demo.orders o
ON o.account_id = a.id
AND o.occurred_at < '2017-04-01'
JOIN demo.sales_reps sr
ON a.sales_rep_id = sr.id
JOIN demo.region r
ON sr.region_id = r.id
JOIN demo.web_events_new we
ON we.account_id = o.account_id
AND o.occurred_at BETWEEN we.occurred_at AND we.occurred_at + interval '31 minutes'
where DATE_TRUNC('day',o.occurred_at) + interval '2 year' between '01-01-2017' and '12-20-2017'
GROUP BY 1, 2,3
ORDER BY 1
) x



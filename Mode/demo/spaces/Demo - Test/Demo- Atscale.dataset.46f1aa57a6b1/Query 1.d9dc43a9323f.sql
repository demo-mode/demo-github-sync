SELECT * FROM tutorial.accounts a
JOIN tutorial.orders o
ON a.id = o.account_id
JOIN tutorial.regions r
ON a.region_id = r.id
LIMIT 1000;
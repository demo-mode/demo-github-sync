SELECT
r.location_id AS "Store Number",
COUNT(s.transaction_id) AS "Transaction Count"
FROM mode_onboarding.mcquery_sales s
 JOIN mode_onboarding.mcquery_restaurants r
ON s.store_number = r.location_id
Group by 1
order by 2 DESC

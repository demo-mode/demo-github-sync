SELECT
  transaction_id as "Transaction ID",
  date_of_transaction as "Date of Transaction",
  SUM(sub_total+tax) as "Grand Total"
FROM mode_onboarding.mcquery_sales s
JOIN mode_onboarding.mcquery_restaurants r
ON r.location_id = s.store_number
--WHERE r.location_id LIKE '{{store_number}}'
GROUP BY 2, 1
ORDER BY 3
LIMIT 10

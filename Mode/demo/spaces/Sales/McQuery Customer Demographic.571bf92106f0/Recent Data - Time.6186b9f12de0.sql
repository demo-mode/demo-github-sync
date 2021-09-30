SELECT
  transaction_id AS "Transaction ID",
  date_of_transaction AS "Date of Transaction",
  sub_total as "Order Sub-Total",
  tax as "Tax",
  number_of_items as "Number of Items in Order"
FROM mode_onboarding.mcquery_sales s
JOIN mode_onboarding.mcquery_restaurants r
ON r.location_id = s.store_number
--WHERE r.location_id LIKE '{{store_number}}'
ORDER BY 2
LIMIT 10

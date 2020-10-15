SELECT *
FROM roberto_salcido899.marketingcalcfields
WHERE occurred_at > '{{ Start_Date }}'
  AND occurred_at < '{{ End_Date }}'
  AND channel != '#N/A'
ORDER BY occurred_at,
         channel
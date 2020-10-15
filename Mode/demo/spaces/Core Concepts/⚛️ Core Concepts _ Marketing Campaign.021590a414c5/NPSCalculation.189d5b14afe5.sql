SELECT CREATED_AT,
       totalscore,
       100 AS multiplier
FROM roberto_salcido899.demonpsscore
WHERE created_at > '{{ Start_Date }}'
  AND created_at < '{{ End_Date }}'
ORDER BY 1
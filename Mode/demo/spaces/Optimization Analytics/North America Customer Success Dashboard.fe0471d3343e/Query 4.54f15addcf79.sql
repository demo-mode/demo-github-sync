SELECT T1.FIRST_NAME||' '||left(T1.LAST_NAME,1)||'.' AS NAME,
T2.BONUS/150 AS "TICKETS RESOLVED"
FROM 
adventureworks_analytics.all_person_info T1
JOIN adventureworks_analytics.sales_rep_info T2
ON T1.PERSON_ID = T2.PERSON_ID
JOIN adventureworks_analytics.territory_names T3
ON T2.TERRITORY_ID = T3.TERRITORYID
ORDER BY 2 DESC
limit 5;
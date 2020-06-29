-- Returns first 100 rows from demo.flights
SELECT * FROM demo.flights LIMIT 100;


SELECT origin_airport, COUNT(1)
FROM demo.flights
GROUP BY 1 
ORDER BY 2 DESC
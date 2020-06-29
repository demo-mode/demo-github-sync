with airports as (

SELECT origin_airport, COUNT(1)
FROM demo.flights
WHERE airline_name ='Delta Air Lines Inc.'
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 20

)

SELECT origin_airport, destination_airport, COUNT(1)
-- SELECT COUNT(DISTINCT destination_airport)
FROM demo.flights 
WHERE destination_airport IN (SELECT origin_airport FROM airports)
AND origin_airport IN (SELECT origin_airport FROM airports)
GROUP BY 1,2


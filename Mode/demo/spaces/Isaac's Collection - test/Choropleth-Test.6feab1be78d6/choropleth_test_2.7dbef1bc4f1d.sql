with totals AS 
(SELECT state, SUM(population_estimate_2012) AS Total_State_Population FROM tutorial.city_populations GROUP BY 1 ORDER BY 1)

SELECT tcp.*, totals.Total_state_Population 
FROM tutorial.city_populations tcp
JOIN totals 
ON tcp.state = totals.state

--==============================================
with totals AS 
(SELECT state, SUM(population_estimate_2012) AS Total_State_Population FROM tutorial.city_populations GROUP BY 1 ORDER BY 1)

SELECT tcp.city, tcp.state, tcp.id, sum(tcp.population_estimate_2012) AS City_Population_2012, SUM(totals.Total_state_Population) 
FROM tutorial.city_populations tcp
JOIN totals 
ON tcp.state = totals.state
GROUP BY 2,1,3

--=============================================
SELECT * FROM tutorial.city_populations
SELECT country,
       country_code,
       ROUND(life_expectancy::NUMERIC,1) * 1000 AS life_expectancy
  FROM benn.life_expectancy_by_country
 WHERE life_expectancy IS NOT NULL
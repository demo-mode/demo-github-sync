SELECT ROUND(lat::numeric,2) as lat,
       ROUND(lng::numeric,2) AS long
  FROM modeanalytics.fastfood_locations_2007
 WHERE restaurant = 'i'
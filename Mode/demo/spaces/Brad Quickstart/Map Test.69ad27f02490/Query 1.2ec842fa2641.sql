SELECT ROUND(lat::numeric,2) as lat,
       ROUND(lng::numeric,2) AS lng,
       state
  FROM modeanalytics.fastfood_locations_2007
 WHERE restaurant = 'c'
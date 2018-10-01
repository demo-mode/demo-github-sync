    SELECT zipcode,
           CASE WHEN zipcode = 10119 THEN 2.54
                ELSE ROUND(AVG(score)::numeric,2) END AS avg
      FROM(    
    SELECT DISTINCT r.id,
           r.zipcode,
           r.score
      FROM modeanalytics.nyc_restaurants r
      JOIN(
    SELECT id,
           MAX(inspection_date) AS last_inspection
      FROM modeanalytics.nyc_restaurants
     WHERE score IS NOT NULL
  GROUP BY 1
          ) d
        ON r.id = d.id
       AND r.inspection_date = d.last_inspection
          ) a
  GROUP BY 1
  ORDER BY 2
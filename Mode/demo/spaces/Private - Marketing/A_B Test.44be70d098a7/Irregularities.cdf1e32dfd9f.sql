    SELECT anonymous_id AS "anonymous users exposed to multiple variations",
           CASE WHEN signup = 1 THEN TRUE ELSE FALSE END AS signup,
           CASE WHEN trial = 1 THEN TRUE ELSE FALSE END AS trial,
           CASE WHEN conversion = 1 THEN TRUE ELSE FALSE END AS conversion
      FROM (
    SELECT variation_name,
           anonymous_id,
           signup,
           trial,
           conversion
      FROM modeanalytics.demo_experiment_results
     WHERE experiment_name = '{{ experiment }}'
         ) a
     GROUP BY 1,2,3,4
    HAVING COUNT(variation_name) > 1
     ORDER BY 4 DESC,3 DESC,2 DESC,1
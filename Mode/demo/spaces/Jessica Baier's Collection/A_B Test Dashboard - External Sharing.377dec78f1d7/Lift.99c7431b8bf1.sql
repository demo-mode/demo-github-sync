    SELECT *,
           (mean - LEAD(mean) OVER (ORDER BY variation_name DESC)) / NULLIF(LEAD(mean) OVER (ORDER BY variation_name DESC),0) AS lift
      FROM (
    SELECT variation_name,
           SUM({{ outcome }}) / COUNT (anonymous_id)::numeric AS mean
      FROM modeanalytics.demo_experiment_results
     WHERE experiment_name = '{{ experiment }}'
       AND variation_name IN ('Original','Variation #1')
     GROUP BY 1
         ) a
     ORDER BY 1
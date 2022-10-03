    SELECT DISTINCT variation_name,
           anonymous_id,
           signup,
           trial,
           conversion,
           {{ outcome }} AS outcome
      FROM modeanalytics.demo_experiment_results
     WHERE experiment_name = '{{ experiment }}'
    SELECT variation_name,
           COUNT(anonymous_id) AS n,
           SUM(signup) AS signups,
           SUM(signup) / NULLIF(COUNT(anonymous_id),0)::numeric AS signup_rate,
           SUM(trial) AS trials,
           SUM(trial) / NULLIF(COUNT(anonymous_id),0)::numeric AS trial_rate,
           SUM(conversion) AS conversions,
           SUM(conversion) / NULLIF(COUNT(anonymous_id),0)::numeric AS conversion_rate
      FROM modeanalytics.demo_experiment_results
     WHERE experiment_name = '{{ experiment }}'
     GROUP BY 1
     ORDER BY 1
     
    
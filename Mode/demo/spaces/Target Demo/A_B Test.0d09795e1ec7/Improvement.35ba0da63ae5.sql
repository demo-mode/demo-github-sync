SELECT NULL AS improvement

UNION ALL

SELECT *
  FROM (

WITH

  control AS(
    SELECT conversion_rate
      FROM modeanalytics.experiment_stats 
     WHERE cohort = 'control'
          ),
          
  test AS(
    SELECT conversion_rate
      FROM modeanalytics.experiment_stats 
     WHERE cohort = 'test'
        )
     
    SELECT (test.conversion_rate - control.conversion_rate) / control.conversion_rate::FLOAT AS improvement
      FROM control
      JOIN test
        ON 1=1
      ) a
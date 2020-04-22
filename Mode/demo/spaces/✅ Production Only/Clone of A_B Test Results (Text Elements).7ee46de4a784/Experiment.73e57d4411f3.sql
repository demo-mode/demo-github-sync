    SELECT cohort,
           visitors,
           conversions,
           conversion_rate AS "conversion rate"
      FROM modeanalytics.experiment_stats
  ORDER BY 1
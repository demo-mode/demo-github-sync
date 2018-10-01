    SELECT month,
           current_trajectory AS "Current trajectory",
           all_data_centers AS "All intl data centers",
           asia_data_center AS "Asian data center"
      FROM modeanalytics.users_forecast 
  ORDER BY 1
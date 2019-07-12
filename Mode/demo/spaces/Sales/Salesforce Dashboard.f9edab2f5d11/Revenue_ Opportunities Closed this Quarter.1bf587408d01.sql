SELECT extract(month from close_date) AS month,
 COUNT(*) AS opportunities,
 to_char(close_date, 'Month') as Month
 FROM modeanalytics.salesforce_opportunities
 WHERE extract(quarter from close_date) = extract(quarter from CURRENT_DATE)
 and stage_name = 'Closed Won'
 GROUP BY 1,3
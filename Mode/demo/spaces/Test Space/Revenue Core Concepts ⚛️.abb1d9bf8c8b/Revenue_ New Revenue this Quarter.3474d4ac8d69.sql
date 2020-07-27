SELECT sum(total_value_c) AS amount
FROM modeanalytics.salesforce_opportunities
WHERE extract(quarter
              FROM close_date) = extract(quarter
                                         FROM CURRENT_DATE)
  AND stage_name = 'Closed Won'
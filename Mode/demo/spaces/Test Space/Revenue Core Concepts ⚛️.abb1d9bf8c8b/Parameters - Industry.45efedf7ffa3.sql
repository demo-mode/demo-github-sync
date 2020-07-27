
SELECT industry AS industry
FROM modeanalytics.salesforce_accounts 


{% form %}

industry:
  type: select
  default: 'Research'
  options:
    labels: industry
    values: industry

{% endform %}
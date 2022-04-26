
SELECT
  LAST_EDITED_AT_UTC
FROM
  MODE.ORGANIZATION_USAGE.REPORTS
WHERE
  (LAST_EDITED_AT_UTC BETWEEN DATE('{{ report_start_date }}') - INTERVAL '14 DAYS'
  AND DATE('{{ report_start_date }}'))
  OR
  (LAST_EDITED_AT_UTC BETWEEN DATE('{{ report_start_date }}') - INTERVAL '6 MONTHS' - INTERVAL '14 DAYS'
  AND DATE('{{ report_start_date }}') - INTERVAL '6 MONTHS')
ORDER BY
  LAST_EDITED_AT_UTC ASC

{% assign day_of_week = 'now' | date:'%w' | plus: 0 | times: 86400 %}
{% assign today = 'now' | date:'%s' %}
{% assign sunday = {{today | minus: {{day_of_week}} | date:'%Y-%m-%d'}} %} 


{% form %}


report_start_date:
  type: date
  default: {{ sunday }}
  
{% endform %}

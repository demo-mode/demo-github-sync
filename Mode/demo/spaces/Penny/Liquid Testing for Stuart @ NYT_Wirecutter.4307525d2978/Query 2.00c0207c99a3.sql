-- Returns first 100 rows from MODE.ORGANIZATION_USAGE.REPORTS
SELECT
  LAST_EDITED_AT_UTC as "{{ test1 }}"
FROM
  MODE.ORGANIZATION_USAGE.REPORTS
  /*
WHERE
  (LAST_EDITED_AT_UTC BETWEEN DATE('{{ reports_start_date_sunday }}') - INTERVAL '14 DAYS'
  AND DATE('{{ reports_start_date_sunday }}'))
  OR
  (LAST_EDITED_AT_UTC BETWEEN DATE('{{ reports_start_date_sunday }}') - INTERVAL '6 MONTHS' - INTERVAL '14 DAYS'
  AND DATE('{{ reports_start_date_sunday }}') - INTERVAL '6 MONTHS')
ORDER BY
  LAST_EDITED_AT_UTC ASC
  
  */

{% assign day_of_week = 'now' | date:'%w' | plus: 0 | times: 86400 %}
{% assign today = 'now' | date:'%s' %}
{% assign sunday = {{today | minus: {{day_of_week}} | date:'%Y-%m-%d'}} %} 

{% form %}


test1:
  type: date
  default: {{ sunday }}
  
{% endform %}
-- Returns first 100 rows from MODE.ORGANIZATION_USAGE.REPORTS
SELECT
  LAST_EDITED_AT_UTC
FROM
  MODE.ORGANIZATION_USAGE.REPORTS
WHERE
  (LAST_EDITED_AT_UTC BETWEEN DATE('{{ reports_start_date_default }}') - INTERVAL '14 DAYS'
  AND DATE('{{ reports_start_date_default }}'))
  OR
  (LAST_EDITED_AT_UTC BETWEEN DATE('{{ reports_start_date_default }}') - INTERVAL '6 MONTHS' - INTERVAL '14 DAYS'
  AND DATE('{{ reports_start_date_default }}') - INTERVAL '6 MONTHS')
ORDER BY
  LAST_EDITED_AT_UTC ASC

{% form %}

reports_start_date_default:
  type: date
  default: {{ 'now' | date: "%Y-%m-%d"}}
  
{% endform %}
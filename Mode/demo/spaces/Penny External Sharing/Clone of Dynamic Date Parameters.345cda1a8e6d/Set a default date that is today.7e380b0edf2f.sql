--- This report will set a dynamic default date parameter to the most recent Sunday
--- Additionally, this report contains logic to revert to default if the selected date is 1970-01-01


-- Liquid Requires the creation of one-time use variables for this calculation
-- The control flow logic should be above your SQL query
{% assign temp_date = report_start_date | date: '%s' | plus:0  %}
{% if temp_date == 0 %}
{% assign query_date = {{sunday}} %}
{% else %}
{% assign query_date = {{report_start_date}} %}
{% endif %}


-- This is a very simple query that will return the date selected by parameter, the temporary variable used in control flow logic, and the date that is actually passed to the query
SELECT
  '{{report_start_date}}' as parameter_from_view,
  '{{temp_date}}' as temp_date, 
  '{{query_date}}' as query_date



--- These are example calculations are a function that will convert 'today' into 'last sunday' dynamically
{% assign day_of_week = 'now' | date:'%w' | plus: 0 | times: 86400 %}
{% assign today = 'now' | date:'%s' %}
{% assign sunday = {{today | minus: {{day_of_week}} | date:'%Y-%m-%d'}} %} 


-- Here I use liquid variable as a default in my Mode Parameter selection form
{% form %}
report_start_date:
  type: date
  default:  {{sunday}}
{% endform %}


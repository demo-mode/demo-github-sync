SELECT
  pg_sleep(10);

SELECT
  *
FROM
  demo.monthly_sales
{% if salesrep != '' %}
WHERE
  sales_rep LIKE '{{salesrep}}%'
{% endif %}
  
{% form %}
salesrep:
  type: text
{% endform %}
  

SELECT account_id,
       DATE_TRUNC('{{interval}}',occurred_at) AS time_id,
       SUM(standard_qty) AS "Standard",
       SUM(gloss_qty) AS "Glossy",
       SUM(poster_qty) AS "Poster",
       SUM(total) AS "Total"
  FROM demo.orders o
 WHERE occurred_at < DATE_TRUNC('{{interval}}',NOW())
   AND account_id = {{ account_id }}
 GROUP BY 1,2
 ORDER BY 1,2

{% form %}

account_id:
  type: text
  default: 1001

interval:
  type: select
  default: month
  options: ['quarter','month']

{% endform %}
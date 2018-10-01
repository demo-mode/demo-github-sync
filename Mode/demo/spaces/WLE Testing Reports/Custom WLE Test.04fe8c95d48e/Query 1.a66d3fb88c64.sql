SELECT a.name,
       o.*
  FROM demo.orders o
  JOIN demo.accounts a
    ON a.id = o.account_id
 WHERE o.account_id = {{ account_id }}
   AND o.occurred_at < DATE_TRUNC('month',NOW())
 ORDER BY occurred_at

{% form %}

account_id:
  type: text
  default: 1711

{% endform %}
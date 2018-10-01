SELECT
  NOW()
FROM
  demo.web_events
WHERE
  occurred_at BETWEEN '{{start_time}}' AND '{{end_time}}'
ORDER BY occurred_at
LIMIT 20

{% form %}
start_time:
  type: date
  default: 2013-12-04 04:18:29
  
end_time:
  type: date
  default: 2013-12-11 10:52:30

{% endform %}
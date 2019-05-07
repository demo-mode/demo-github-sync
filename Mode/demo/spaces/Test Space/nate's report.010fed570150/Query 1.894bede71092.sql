SELECT * FROM {{ @nate_test }}

{% form %}
test:
  type: select
  options:
    labels: num
    values: num
{% endform %}
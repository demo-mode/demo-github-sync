SELECT 'All' AS region
union
SELECT DISTINCT(name) AS region
FROM demo.region

{% form %}

region:
  label: "Select a Region"
  type: select
  default: 'West'
  options:
    labels: region
    values: region

{% endform %}
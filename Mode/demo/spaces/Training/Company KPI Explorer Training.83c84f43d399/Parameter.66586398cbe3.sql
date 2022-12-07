SELECT DISTINCT(name) AS region
FROM demo.region

{% form %}

region:
  label: "Select a Region"
  type: multiselect
  default: all
  options:
    labels: region
    values: region

{% endform %}
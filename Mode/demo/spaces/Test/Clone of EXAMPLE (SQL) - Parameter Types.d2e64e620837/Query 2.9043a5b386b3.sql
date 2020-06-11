SELECT id, name 
FROM demo.sales_reps

{% form %}

sales_rep:
  type: multiselect
  default: all
  options:
    labels: name
    values: id
    
{% endform %}
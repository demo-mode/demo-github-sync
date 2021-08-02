SELECT
  DISTINCT name AS "Customer Support Manager"
FROM
  demo.sales_reps 
  
  
{% form %}
 
Customer Support Manager:
  type: multiselect
  default: Renetta Carew
  options:
    values: Customer Support Manager
    labels: Customer Support Manager
    
{% endform %}
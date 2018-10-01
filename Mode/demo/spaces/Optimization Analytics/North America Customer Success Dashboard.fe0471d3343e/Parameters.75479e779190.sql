SELECT
  DISTINCT name AS "Customer Success Manager"
FROM
  demo.sales_reps 
  
  
{% form %}
 
Customer Success Manager:
  type: multiselect
  default: Renetta Carew
  options:
    values: Customer Success Manager
    labels: Customer Success Manager
    
{% endform %}
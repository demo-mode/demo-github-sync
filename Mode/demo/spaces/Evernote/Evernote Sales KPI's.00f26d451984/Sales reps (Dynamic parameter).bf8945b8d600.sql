SELECT
  DISTINCT name AS sales_rep
FROM
  demo.sales_reps 
  
  
{% form %}
 
sales_rep:
  type: select
  default: Renetta Carew
  options:
    values: sales_rep
    labels: sales_rep
    
{% endform %}
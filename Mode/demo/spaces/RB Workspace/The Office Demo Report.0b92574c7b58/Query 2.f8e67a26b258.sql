SELECT * FROM {{ @Paper_Sales }}

WHERE region in ({{ region }})



{% form %}

region:
  type: multiselect
  default: all 
  options: [Northeast, Midwest, West, Southeast]
  
{% endform %}
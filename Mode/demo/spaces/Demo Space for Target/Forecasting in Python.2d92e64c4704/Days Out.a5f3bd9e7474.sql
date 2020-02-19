SELECT {{days_out}} AS days_out
  
  
{% form %}

days_out:
  type: text
  default: 60
  description: How many days out do you want the forecast to be?

{% endform %}
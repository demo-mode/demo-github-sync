select *
from tutorial.us_housing_units 
where south = '{{south}}'


{% form %}
south:
  type: text
  default: 35.6
{% endform %}
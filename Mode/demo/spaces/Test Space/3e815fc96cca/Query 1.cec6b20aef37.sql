SELECT * FROM tutorial.nominee_information WHERE birthday = '{{ birthday }}'

{% form %}
birthday:
  type: date
  default: 1910-01-12
{% endform %}
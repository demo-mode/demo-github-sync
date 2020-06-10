SELECT *
  FROM {{ @parameterized_channel_events }}
 ORDER BY 1

{% form %}

channel:
  type: select
  default: facebook 
  options: ['adwords','direct','banner','facebook','organic','twitter']

{% endform %}
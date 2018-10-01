SELECT
  DISTINCT channel AS channel
FROM
  {{ @order_channel_new as oc }} 
  
  
{% form %}
 
channel:
  type: select
  default: facebook
  options:
    values: channel
    labels: channel
    
{% endform %}
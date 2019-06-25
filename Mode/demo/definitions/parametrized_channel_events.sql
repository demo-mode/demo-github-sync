{% unless channel %}
  {% assign channel = 'direct' %}
{% endunless %}

    SELECT DATE_TRUNC('week',occurred_at) AS day,
           we.channel,
           COUNT(*) AS events
      FROM demo.web_events we
     WHERE we.channel = '{{channel}}'
     GROUP BY 1,2
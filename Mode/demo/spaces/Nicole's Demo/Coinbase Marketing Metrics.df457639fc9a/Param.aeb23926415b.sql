select {{preferred_date}} as preferred_date


/*
{% form %}

preferred_date:
  type: select
  default: {{'now' | date:"%s" | date: "%Y-%m-%d"}}
  options: [['Today', {{'now' | date: "%Y-%m-%d"}}],
  ['Yesterday', {{'now' | date: "%s" | minus : 86400 | date: "%Y-%m-%d"}}],
  ['Last 7 Days', {{'now' | date: "%s" | minus : 604800 | date: "%Y-%m-%d"}}],
  ['Last 30 Days', {{'now' | date: "%s" | minus : 2628000 | date: "%Y-%m-%d"}}],
  ['Freeform', {{'now' | date: "%s" | minus : 31540000 | date: "%Y-%m-%d"}}]]

{% endform %}*/
{% form %}

preferred_date:
  type: select
  default: 365
  options: [['365 Days', 365], ['90 Days', 90], ['Last 30 Days', 30],   ['Last 7 Days', 7],  ['Yesterday', 1]

    ]

{% endform %}
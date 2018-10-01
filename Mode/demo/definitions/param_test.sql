    SELECT a.name AS company,
           DATE_TRUNC('day',o.occurred_at) AS time_id,
           SUM(o.gloss_qty) AS gloss_units,
           SUM(o.poster_qty) AS poster_units,
           SUM(o.standard_qty) AS standard_units,
           SUM(o.total_amt_usd) AS total_sales_usd
      FROM demo.accounts a
      JOIN demo.orders o
        ON o.account_id = a.id
       AND o.occurred_at >= '{{ start_date }}'
       AND o.occurred_at < '2017-01-01'
      JOIN demo.web_events_new we
        ON we.account_id = o.account_id
       AND we.channel IN ({{ channel }})
       AND o.occurred_at BETWEEN we.occurred_at AND we.occurred_at + interval '31 minutes'
     WHERE a.name ILIKE '{{ account }}'
     GROUP BY 1,2
     ORDER BY 1,2
     
     
{% form %}
account:
  type: text
  default: Walmart
  
channel:
  type: multiselect
  default: direct
  options:
    [
      adroll,
      adwords,
      banner,
      direct,
      email,
      facebook,
      linkedin,
      organic,
      twitter
    ]
    
start_date:
  type: date
  default: '2016-01-01'
  
{% endform %}
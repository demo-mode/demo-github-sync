    SELECT DATE_TRUNC('day',o.occurred_at) + INTERVAL '1400 DAY' AS date,
           r.name as region,
           we.channel,
           SUM(o.gloss_qty) AS gloss_units,
           SUM(o.poster_qty) AS poster_units,
           SUM(o.standard_qty) AS standard_units,
           SUM(o.total_amt_usd) AS total_sales_usd,
           (SUM(o.gloss_qty) * SUM(o.poster_qty)) AS non_standard_sales
      FROM demo.accounts a
      JOIN demo.orders o
        ON o.account_id = a.id
      JOIN demo.sales_reps sr
        ON a.sales_rep_id = sr.id
      JOIN demo.region r
        ON sr.region_id = r.id
      JOIN demo.web_events_new we
        ON we.account_id = o.account_id
       AND o.occurred_at BETWEEN we.occurred_at AND we.occurred_at + interval '31 minutes'
     WHERE r.name in ({{region}})
     GROUP BY 1,2,3
     ORDER BY 1,2,3
     
{% form %}

region:
  label: "Select a Region"
  type: multiselect
  default: all
  options:
    labels: region
    values: region

{% endform %}
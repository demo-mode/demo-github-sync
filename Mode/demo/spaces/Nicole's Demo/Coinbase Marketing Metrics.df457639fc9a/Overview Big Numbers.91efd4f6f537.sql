    SELECT DATE_TRUNC('month',o.occurred_at) + INTERVAL '1400 DAY' as month,
           oc.channel,
           SUM(o.total_amt_usd)as total_amt_usd,
           SUM(o.total_amt_usd) / sum(o.total) * 1000 as cac,
           sum(o.gloss_qty) /sum(o.poster_amt_usd) as conversion_rate
      FROM {{ @order_channel_new as oc }}
      JOIN demo.orders o
        ON oc.order_id = o.id
     and o.total > 0
     and o.poster_amt_usd > 0
  GROUP BY 1,2
  ORDER BY 1,2
    SELECT DATE_TRUNC('day',o.occurred_at) + INTERVAL '2102 DAY' as day,
           oc.channel,
           SUM(o.total_amt_usd)as total_amt_usd,
           sum(o.gloss_qty) as gloss_qty,
           sum(o.standard_qty) as std_qty
      FROM {{ @order_channel_new as oc }}
      JOIN demo.orders o
        ON oc.order_id = o.id
    WHERE oc.channel NOT IN ('direct') and (o.occurred_at + interval '2102 days') > current_date - interval '{{preferred_date}} days'
  GROUP BY 1,2
  ORDER BY 1,2

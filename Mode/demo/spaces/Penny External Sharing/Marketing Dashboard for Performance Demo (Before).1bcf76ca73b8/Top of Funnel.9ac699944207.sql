    SELECT DATE_TRUNC('month',o.occurred_at) + INTERVAL '1220 DAY' as month,
           oc.channel,
           SUM(o.total_amt_usd)as total_amt_usd,
           sum(o.gloss_qty) as gloss_qty,
           sum(o.standard_qty) as std_qty
      FROM {{ @order_channel_new as oc }}
      JOIN demo.orders o
        ON oc.order_id = o.id
    WHERE oc.channel NOT IN ('direct')
    and DATE_TRUNC('month',o.occurred_at) + INTERVAL '1220 DAY' > '2019-05-01 00:00:00'
  GROUP BY 1,2
  ORDER BY 1,2

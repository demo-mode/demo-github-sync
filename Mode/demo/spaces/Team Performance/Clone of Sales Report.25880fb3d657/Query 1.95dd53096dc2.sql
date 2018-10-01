SELECT DATE_TRUNC('month',o.occurred_at)AS
month,
       oc.channel,
       SUM(o.total_amt_usd)AS total_amt_usd
FROM {{ @order_channel AS oc }}
JOIN demo.orders o
  ON oc.order_id = o.id
  AND o.occurred_at < NOW()
WHERE oc.channel NOT IN ('direct',
                         'organic')
GROUP BY 1,
         2
ORDER BY 1,
         2
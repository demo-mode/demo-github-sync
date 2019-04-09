    SELECT DATE_TRUNC('month',o.occurred_at)as month,
           oc.channel,
           SUM(o.total_amt_usd)as total_amt_usd
      FROM {{ @order_channel_new as oc }}
      JOIN demo.orders o
        ON oc.order_id = o.id
       AND o.occurred_at BETWEEN '2016-01-01' AND '2016-12-31 23:59:59'
     WHERE oc.channel NOT IN ('direct','organic')
     and oc.channel = {{'channel'}}
  GROUP BY 1,2
  ORDER BY 1,2
  
  

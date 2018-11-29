    SELECT DATE_TRUNC('month',o.occurred_at)as month,
           CASE WHEN oc.channel IN ('direct','organic') THEN 'unpaid'
                ELSE 'paid' END as channel_type,
           SUM(o.total)as units_sold
      FROM {{ @order_channel as oc }}
      JOIN demo.orders o
        ON oc.order_id = o.id
       AND o.occurred_at BETWEEN '2016-01-01' AND '2016-12-31 23:59:59'
  GROUP BY 1,2
  ORDER BY 1,2 DESC
  
  ---hello
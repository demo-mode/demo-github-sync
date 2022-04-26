    SELECT o.id AS order_id,
           o.occurred_at + INTERVAL '3 YEARS' AS orderd_at,
           oc.channel,
           CASE WHEN oc.channel IN ('direct','organic') THEN 'unpaid'
                ELSE 'paid' END as channel_type,
           o.standard_qty AS standard,
           o.poster_qty AS poster,
           o.gloss_qty AS gloss,
           o.total AS total,
           o.total_amt_usd AS total_amt_usd
      FROM demo.orders o
      JOIN (SELECT we.channel,
                   o.id as order_id,
                   row_number() OVER (PARTITION BY o.id ORDER BY we.occurred_at ASC)
              FROM demo.orders o
              JOIN demo.web_events_new we
                ON o.occurred_at BETWEEN we.occurred_at AND we.occurred_at + interval '31 minutes'
            ) oc
        ON oc.order_id = o.id
       AND oc.row_number = 1
     WHERE o.occurred_at < '2017-01-01'
     ORDER BY 2
     
     
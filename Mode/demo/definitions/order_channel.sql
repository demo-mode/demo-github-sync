  SELECT channel,
         order_id
    FROM(
  SELECT we.channel,
         o.id as order_id,
         row_number() OVER (PARTITION BY o.id ORDER BY we.occurred_at ASC)
    FROM demo.orders o
    JOIN demo.web_events we
      ON o.occurred_at BETWEEN we.occurred_at AND we.occurred_at + interval '31 minutes'
        )as a
WHERE row_number = 1
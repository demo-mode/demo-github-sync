WITH account_orders AS (
  SELECT occurred_at,
         'Standard' AS order_type,
         standard_qty AS qty
    FROM demo.orders 
   WHERE account_id = {{ account_id }}

 UNION ALL
 
  SELECT occurred_at,
         'Glossy' AS order_type,
         gloss_qty AS qty
    FROM demo.orders 
   WHERE account_id = {{ account_id }}
 
 UNION ALL
 
  SELECT occurred_at,
         'Poster' AS order_type,
         poster_qty AS qty
    FROM demo.orders 
   WHERE account_id = {{ account_id }}
)

SELECT occurred_at AS "Order date",
       order_type,
       qty
  FROM account_orders

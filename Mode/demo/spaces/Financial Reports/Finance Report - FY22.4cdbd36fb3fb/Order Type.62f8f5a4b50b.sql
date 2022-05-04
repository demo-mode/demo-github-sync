WITH account_orders AS (
  SELECT *
    FROM demo.orders 
   WHERE account_id = {{ account_id }}
     AND occurred_at < DATE_TRUNC('{{interval}}',NOW())
)

SELECT *
  FROM (

SELECT account_id,
       'Standard' AS order_type,
       SUM(standard_qty) AS order_amount
  FROM account_orders
 GROUP BY 1,2

UNION ALL 

SELECT account_id,
       'Glossy' AS order_type,
       SUM(gloss_qty) AS order_amount
  FROM account_orders
 GROUP BY 1,2

UNION ALL

SELECT account_id,
       'Poster' AS order_type,
       SUM(poster_qty) AS order_amount
  FROM account_orders
 GROUP BY 1,2

       ) a

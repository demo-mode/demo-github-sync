SELECT time_id AS "Order date",
       *
  FROM (
  
SELECT a.name,
        account_id,
       DATE_TRUNC('month',occurred_at) AS time_id,
       'month' AS interval,
       SUM(standard_qty) AS "Standard",
       SUM(gloss_qty) AS "Glossy",
       SUM(poster_qty) AS "Poster",
       SUM(total) AS "Total"
  FROM demo.orders o
  JOIN demo.accounts a on a.id=o.account_id
 WHERE occurred_at < DATE_TRUNC('month',NOW())
   AND account_id = {{ account_id }}
 GROUP BY 1,2,3

UNION ALL

SELECT 
        a.name,
       account_id,
       DATE_TRUNC('quarter',occurred_at) AS time_id,
       'quarter' AS interval,
       SUM(standard_qty) AS "Standard",
       SUM(gloss_qty) AS "Glossy",
       SUM(poster_qty) AS "Poster",
       SUM(total) AS "Total"
  FROM demo.orders o
    JOIN demo.accounts a on a.id=o.account_id
 WHERE occurred_at < DATE_TRUNC('quarter',NOW())
   AND account_id = {{ account_id }}
 GROUP BY 1,2,3
       ) z

 ORDER BY 1,2,3

{% form %}

account_id:
  type: text
  default: 1001

{% endform %}
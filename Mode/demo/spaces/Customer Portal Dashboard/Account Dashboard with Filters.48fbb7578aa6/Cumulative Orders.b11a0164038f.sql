SELECT time_id AS "Order date",
       *
  FROM (

SELECT account_id,
       time_id,
       interval,
       SUM(standard) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Standard",
       SUM(glossy) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Glossy",
       SUM(poster) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Poster",
       SUM(total) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Total"
  FROM (
        SELECT account_id,
               DATE_TRUNC('month',occurred_at) AS time_id,
               'month' AS interval,
               SUM(standard_qty) AS standard,
               SUM(gloss_qty) AS glossy,
               SUM(poster_qty) AS poster,
               SUM(total) AS total
          FROM demo.orders
         WHERE occurred_at < DATE_TRUNC('month',NOW())
           AND account_id = {{ account_id }}
         GROUP BY 1,2,3
       ) a

UNION ALL

SELECT account_id,
       time_id,
       interval,
       SUM(standard) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Standard",
       SUM(glossy) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Glossy",
       SUM(poster) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Poster",
       SUM(total) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Total"
  FROM (
        SELECT account_id,
               DATE_TRUNC('quarter',occurred_at) AS time_id,
               'quarter' AS interval,
               SUM(standard_qty) AS standard,
               SUM(gloss_qty) AS glossy,
               SUM(poster_qty) AS poster,
               SUM(total) AS total
          FROM demo.orders
         WHERE occurred_at < DATE_TRUNC('quarter',NOW())
           AND account_id = {{ account_id }}
         GROUP BY 1,2,3
       ) a

       ) z
 ORDER BY 1,3,2
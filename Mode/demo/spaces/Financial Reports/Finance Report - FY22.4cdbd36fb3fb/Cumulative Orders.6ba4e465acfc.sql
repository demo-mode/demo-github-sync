SELECT account_id,
       time_id,
       SUM(standard) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Standard",
       SUM(glossy) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Glossy",
       SUM(poster) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Poster",
       SUM(total) OVER (ORDER BY time_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Total"
  FROM (
        SELECT account_id,
               DATE_TRUNC('{{interval}}',occurred_at) AS time_id,
               SUM(standard_qty) AS standard,
               SUM(gloss_qty) AS glossy,
               SUM(poster_qty) AS poster,
               SUM(total) AS total
          FROM demo.orders
         WHERE occurred_at < DATE_TRUNC('{{interval}}',NOW())
           AND account_id = {{ account_id }}
         GROUP BY 1,2
       ) a
 ORDER BY 1,2
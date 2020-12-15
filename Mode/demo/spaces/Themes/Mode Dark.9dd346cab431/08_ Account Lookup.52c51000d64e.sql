    SELECT  a.name,
            'https://' || a.website as website,
            a.primary_poc,
            SUM(o.total_amt_usd) as "total orders (usd)",
            AVG(o.total_amt_usd) as "avg order (usd)",
            SUM(o.total) as "total orders (reams)",
            AVG(o.total) as "avg order (reams)",
            MIN(o.occurred_at) as "first order date",
            MAX(o.occurred_at) as "last order date"
      FROM  demo.accounts a
      JOIN  demo.orders o
        ON  a.id = o.account_id
  GROUP BY  1,2,3
  ORDER BY  1
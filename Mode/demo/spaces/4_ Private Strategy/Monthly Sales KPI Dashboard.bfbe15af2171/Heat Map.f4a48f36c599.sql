    SELECT DISTINCT a.lat,
           a.long
      FROM demo.accounts a
      JOIN demo.orders o
        ON o.account_id = a.id
       AND o.occurred_at < '2017-01-01'
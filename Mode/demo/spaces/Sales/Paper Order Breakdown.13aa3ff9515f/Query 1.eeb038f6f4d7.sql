SELECT a.name,
       AVG(standard_amt_usd) AS standard,
       AVG(gloss_amt_usd + poster_amt_usd) AS special
FROM demo.orders o
JOIN demo.accounts a
  ON o.account_id = a.id
GROUP BY 1
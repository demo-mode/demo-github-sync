SELECT account_id,
       AVG(standard_amt_usd) AS standard,
       AVG(gloss_amt_usd + poster_amt_usd) AS special
  FROM demo.orders 
 GROUP BY 1
select*
from {{ @Sales_Data }}
    SELECT DATE_TRUNC('day',o.occurred_at) AS Date,
           --SUM(o.gloss_qty) AS "Glossy",
           --SUM(o.poster_qty) AS "Poster",
           --SUM(o.standard_qty) AS "Standard",
           SUM(o.gloss_amt_usd) AS "Entertainment",
           SUM(o.poster_amt_usd) AS "Sports",
           SUM(o.standard_amt_usd) AS "News",
           SUM(o.total_amt_usd) AS "Total Sales"
      FROM demo.orders o
     WHERE EXTRACT('year' from o.occurred_at) = 2016
     GROUP BY 1
     ORDER BY 1
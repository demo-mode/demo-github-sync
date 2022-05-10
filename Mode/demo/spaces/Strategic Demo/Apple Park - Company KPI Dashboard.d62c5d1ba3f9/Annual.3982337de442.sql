    SELECT DATE_TRUNC('month',o.occurred_at) + INTERVAL '1400 DAY' AS date,
           COUNT(DISTINCT o.account_id)+(random()*1000) AS customers,
          REPLACE(REPLACE(r.name, 'Midwest', 'Southwest'),'West', 'Northwest') AS "City Region",
            SUM(o.gloss_qty) AS "Under_An_Hour_Parking",
            SUM(o.poster_qty) AS "Single_Hour_Parking",
            SUM(o.standard_qty) AS "Multi_Hour_Parking",
            SUM(o.total) AS "Parking Units Used",
            SUM((o.total_amt_usd)*100) AS total_sales_usd,
           (SUM(o.gloss_qty) + SUM(o.poster_qty)) / SUM(o.total)::float AS non_standard_sales
      FROM demo.orders o
      join demo.accounts a on a.id = o.account_id
      join demo.sales_reps sr on sr.id = a.sales_rep_id 
      join demo.region r on r.id = sr.region_id
      GROUP BY 1,3
      ORDER BY 1,2, 3, 4
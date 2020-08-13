
{% if Industry_Competition == 'standard' %}

 SELECT DATE_TRUNC('month',o.occurred_at) + INTERVAL '1400 DAY' AS date,
           r.name,
           COUNT(DISTINCT o.account_id)+(random()*1000) AS customers,
           SUM(o.gloss_qty) AS gloss_units,
           SUM(o.poster_qty) AS poster_units,
           SUM(o.standard_qty) AS standard_units,
           SUM(o.total) AS total_units,
           SUM(o.total_amt_usd) AS total_sales_usd,
           (SUM(o.gloss_qty) + SUM(o.poster_qty)) / SUM(o.total)::float AS non_standard_sales
      FROM demo.orders o
      join demo.accounts a on a.id = o.account_id
      join demo.sales_reps sr on sr.id = a.sales_rep_id 
      join demo.region r on r.id = sr.region_id
      GROUP BY 1,2
      ORDER BY 1,2, 3, 4
      
{% elsif Industry_Competition == 'high' %}

 SELECT DATE_TRUNC('month',o.occurred_at) + INTERVAL '1400 DAY' AS date,
           r.name,
           COUNT(DISTINCT o.account_id)+(random()*1300)  AS customers,
           SUM(o.gloss_qty) * .7 AS gloss_units,
           SUM(o.poster_qty) * .7  AS poster_units,
           SUM(o.standard_qty) * .7 AS standard_units,
           SUM(o.total) * .7 AS total_units,
           SUM(o.total_amt_usd) * .7 AS total_sales_usd,
           (SUM(o.gloss_qty) + SUM(o.poster_qty)) / SUM(o.total)::float AS non_standard_sales
      FROM demo.orders o
      join demo.accounts a on a.id = o.account_id
      join demo.sales_reps sr on sr.id = a.sales_rep_id 
      join demo.region r on r.id = sr.region_id
      GROUP BY 1,2
      ORDER BY 1,2, 3, 4

{% elsif Industry_Competition == 'low' %}

SELECT DATE_TRUNC('month',o.occurred_at) + INTERVAL '1400 DAY' AS date,
           r.name,
           COUNT(DISTINCT o.account_id)+(random()*700) AS customers,
           SUM(o.gloss_qty) * 1.3 AS gloss_units,
           SUM(o.poster_qty) * 1.3 AS poster_units,
           SUM(o.standard_qty) * 1.3 AS standard_units,
           SUM(o.total) * 1.3 AS total_units,
           SUM(o.total_amt_usd) * 1.3 AS total_sales_usd,
           (SUM(o.gloss_qty) + SUM(o.poster_qty)) / SUM(o.total)::float AS non_standard_sales
      FROM demo.orders o
      join demo.accounts a on a.id = o.account_id
      join demo.sales_reps sr on sr.id = a.sales_rep_id 
      join demo.region r on r.id = sr.region_id
      GROUP BY 1,2
      ORDER BY 1,2, 3, 4
      
{% endif %}




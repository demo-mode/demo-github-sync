
   with model_cte AS (
   
    SELECT o.occurred_at+ INTERVAL '1400 DAY' AS date,
           a.name,
           we.channel,
           SUM(o.gloss_qty) AS gloss_units,
           SUM(o.poster_qty) AS poster_units,
           SUM(o.standard_qty) AS standard_units,
           SUM(o.total_amt_usd) AS total_sales_usd,
           (SUM(o.gloss_qty) * SUM(o.poster_qty)) AS non_standard_sales
      FROM demo.accounts a
      JOIN demo.orders o
        ON o.account_id = a.id
      JOIN demo.sales_reps sr
        ON a.sales_rep_id = sr.id
      JOIN demo.region r
        ON sr.region_id = r.id
      JOIN demo.web_events_new we
        ON we.account_id = o.account_id
    Where a.id = {{ account_id }}
    GROUP BY 1,2,3)
    
    select date, name, case when gloss_units > 2500 then 'North' when gloss_units > 700 then 'South'
    when gloss_units > 200 then 'East' else 'West' end as region, channel, gloss_units, poster_units,
    standard_units, total_sales_usd
    
    from model_cte
    order by 1, 2, 3, 4
    
                 
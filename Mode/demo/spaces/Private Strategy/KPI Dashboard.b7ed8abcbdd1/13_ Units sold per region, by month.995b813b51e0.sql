    SELECT o.occurred_at as period,
           r.name as region,
           SUM(o.total) as units_sold,
           SUM(o.total_amt_usd)as revenue,
           SUM(o.total) / COUNT(sr.id) as units_per_rep
      FROM demo.orders o
      JOIN demo.accounts a
        ON a.id = o.account_id
      JOIN demo.sales_reps sr
        ON sr.id = a.sales_rep_id
      JOIN demo.region r
        ON sr.region_id = r.id
     GROUP BY 1,2
     ORDER BY 1


{% form %}
  
period:
  type: select
  default: month
  options: [day,week,month,quarter,year]

{% endform %}
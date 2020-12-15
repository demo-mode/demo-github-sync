    SELECT r.name as region,
           SUM(o.total) / COUNT(sr.id) as units_sold_per_rep
      FROM demo.orders o
      JOIN demo.accounts a
        ON a.id = o.account_id
      JOIN demo.sales_reps sr
        ON sr.id = a.sales_rep_id
      JOIN demo.region r
        ON sr.region_id = r.id
     WHERE o.occurred_at BETWEEN '{{ start_date }}' AND '{{ end_date }} 23:59:59'
  GROUP BY 1
  ORDER BY 2 DESC

{% form %}

start_date:
  type: date
  default: '2014-12-01'
  
end_date:
  type: date
  default: '2017-01-01'

{% endform %}
    SELECT TO_CHAR(DATE_TRUNC('{{ period }}',o.occurred_at),'YYYY-MM-DD')as period,
           r.name as region,
           sr.name as "sales rep",
           a.name as customer,
           SUM(o.total) as "reams sold",
           SUM(o.total_amt_usd) as "revenue"
      FROM demo.orders o
      JOIN demo.accounts a
        ON o.account_id = a.id
      JOIN demo.sales_reps sr
        ON a.sales_rep_id = sr.id
      JOIN demo.region r
        ON sr.region_id = r.id
       AND CASE WHEN '{{ region }}' = 'All' THEN 1=1
           ELSE '{{ region }}' = r.name END
  GROUP BY 1,2,3,4
  ORDER BY 1
  
{% form %}
  
period:
  type: select
  default: month
  options: [day,week,month,quarter,year]
  
region:
  type: select
  default: Northeast
  options: [[Northeast,Northeast],
            [Midwest,Midwest],
            [Southeast,Southeast],
            [West,West],
            [All,All]]

{% endform %}
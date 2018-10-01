SELECT id as "User ID",
      occurred_at as "Occurred At",
      total as "Units Sold",
      total_amt_usd as "Dollar Amount"
FROM demo.orders
ORDER BY {{category}} DESC
LIMIT {{ Display_Top_x_Results }}

{% form %}


  
category:
 type: select
 default: 'total_amt_usd'
 options: [[Dollar Amount, total_amt_usd],
           [Units Sold, total]]

Display_Top_x_Results:
  type: text
  default: 50

{% endform %}
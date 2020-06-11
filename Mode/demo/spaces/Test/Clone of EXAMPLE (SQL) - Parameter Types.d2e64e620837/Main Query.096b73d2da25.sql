SELECT orders.occurred_at::DATE AS "Date",
       orders.id AS "Order ID",
       orders.standard_amt_usd AS "Standard",
       orders.gloss_amt_usd AS "Glossy",
       orders.poster_amt_usd AS "Poster"
FROM demo.orders
JOIN demo.accounts
  ON accounts.id=orders.account_id
JOIN demo.sales_reps
  ON sales_reps.id=accounts.sales_rep_id
JOIN demo.orders__fulfillments
  ON orders__fulfillments.order_id=orders.id
JOIN demo.region on region.id=sales_reps.region_id
  WHERE orders.occurred_at >= '{{ order_start_date }}'
    AND orders.occurred_at <= '{{ order_end_date }}'
    AND region.name in ({{ sales_region }})
    AND orders.total_amt_usd >= {{ order_min }}
    AND orders.total_amt_usd <= {{ order_max }}
    AND orders__fulfillments.shipment_status = '{{ shipment_status }}'
    AND accounts.sales_rep_id in ({{ sales_rep }})

{% form %}

order_start_date:
  type: date
  default: 2016-01-01
  description: Only display results for orders placed after this date
  
order_end_date:
  type: date
  default: 2016-12-31
  description: Only display results for orders placed before this date
  
sales_region:
  type: multiselect
  default: [Northeast,West]
  description: Display results for one or more sales regions
  input_type: string
  options: [Northeast,Midwest,West,Southeast]
    
order_min:
  type: text
  default: 0
  label: Minimum Order Amt ($)
  description: Only display results for orders over this amount

order_max:
  type: text
  default: 1000
  label: Maximum Order Amt ($)
  description: Only display results for orders less than this amount
  
shipment_status:
    type: select
    default: delivered
    options: [delivered,failure]
  
{% endform %}
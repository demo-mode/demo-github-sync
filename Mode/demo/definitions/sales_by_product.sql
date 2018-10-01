select date_trunc('day',ship_date) as day,
       count(order_quantity) AS Sales
  from adventureworks_analytics.product_base_and_order_details2
 where ship_date > '2017-10-11'
 group by 1
 order by 1
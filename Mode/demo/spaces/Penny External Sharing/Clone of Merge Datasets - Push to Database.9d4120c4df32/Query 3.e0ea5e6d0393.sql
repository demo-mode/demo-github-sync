SELECT
  CASE 
  WHEN shipping_cost ISNULL THEN 0 
  ELSE shipping_cost END as "shipping_cost",
  CASE 
  WHEN discount ISNULL THEN 0 
  ELSE discount END as "discount",
  CASE 
  WHEN payment_cycle = '' THEN 'NONE' 
  ELSE payment_cycle END as "payment_cycle",
  
  order_id,
  status,
  account_id,
  price,
  quantity,
  business_size,
  payment_cycle,
  account_name,
  account_manager,
  days_to_close,
  shipping_address,
  shipping_city,
  shipping_state,
  shipping_zip,
  shipping_latitude,
  shipping_longitude
FROM
 tutorial.dunder_mifflin_paper_sales
 LIMIT 5 
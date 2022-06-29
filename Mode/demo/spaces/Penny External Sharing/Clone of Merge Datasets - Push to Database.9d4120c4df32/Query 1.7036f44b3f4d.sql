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
  payment_cycle
FROM
 tutorial.dunder_mifflin_paper_sales
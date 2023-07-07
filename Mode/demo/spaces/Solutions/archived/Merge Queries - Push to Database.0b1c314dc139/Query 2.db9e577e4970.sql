-- Returns first 100 rows from tutorial.dunder_mifflin_paper_sales
  SELECT * FROM tutorial.dunder_mifflin_paper_sales LIMIT 100;

SELECT
  order_id,
  account_id,
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
  customer_1.Dunder_Mifflin
  
  
  
SELECT
r.location_id AS "Store Number",
r.address AS "Store Street Address",
r.city AS "Store City",
r.state AS "Store State",
r.zipcode AS "Store Zipcode",
r.longitude AS "Store Longitude",
r.latitude AS "Store Latitude",
r.has_drivethru AS "Store Has Drive-Thru",
r.is_24hrs AS "Store Operates 24 Hours",
r.open_date AS "Store Open Date",
r.manager_first_name AS "Store Manager's First Name",
r.manager_last_name AS "Store Manager's Last Name",
s.transaction_id AS "Transaction ID",
s.customer_id AS "Customer ID",
s.time_of_transaction AS "Time Order Started",
s.date_of_transaction AS "Order Date",
s.time_order_completed AS "Time Order Completed",
s.order_channel AS "Order Method",
s.handoff_method AS "Order Handoff Method",
s.delivery_provider AS "Delivery Provider",
s.sub_total AS "Order Subtotal",
s.tax AS "Order Tax",
s.number_of_items AS "Number of Items In Order",
s.catering_order AS "Is Catering Order"
FROM mode_onboarding.mcquery_sales s
JOIN mode_onboarding.mcquery_restaurants r
ON s.store_number = r.location_id
--WHERE r.location_id LIKE '{{store_number}}'

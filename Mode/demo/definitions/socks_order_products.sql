    SELECT order_id,
           user_cross_domain_id,
           SPLIT_PART(product_name::varchar,'"',2) AS name,
           price::numeric AS price,
           quantity::numeric AS quantity,
           price::numeric * quantity::numeric AS product_revenue
      FROM (
    SELECT order_id,
           user_cross_domain_id,
           products -> 'name' AS product_name,
           products ->> 'price' AS price,
           products ->> 'quantity' AS quantity
      FROM (
    SELECT id AS order_id,
           context_traits_cross_domain_id AS user_cross_domain_id,
           json_array_elements(products::json) AS products
      FROM demo.socks_orders
           ) orders
           ) order_products
     ORDER BY 1
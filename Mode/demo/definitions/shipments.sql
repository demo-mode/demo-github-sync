    SELECT f.id AS id,
           f.order_id,
           DATE_TRUNC('year',f.created_at) AS year,
           DATE_TRUNC('month',f.created_at) AS month,
           DATE_TRUNC('week',f.created_at) AS week,
           DATE_TRUNC('day',f.created_at) AS day,
           tracking_company,
           s.price,
           CASE WHEN shipment_status = 'failure' THEN 1 ELSE 0 END AS failure
      FROM demo.orders__fulfillments f
      JOIN demo.shopify_orders_shipping s
        ON f.order_id = s.order_id
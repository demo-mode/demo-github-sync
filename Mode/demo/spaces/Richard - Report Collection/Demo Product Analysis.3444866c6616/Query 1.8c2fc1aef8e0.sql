SELECT *,
product_category_name AS "Product Category",
product_subcategory_name AS "Product Subcategory",
min_inventory_qty AS "Minimum Inventory",
product_price AS "Product Sale Price"
FROM demo.dummydata_adventureworks_product
ORDER BY product_price
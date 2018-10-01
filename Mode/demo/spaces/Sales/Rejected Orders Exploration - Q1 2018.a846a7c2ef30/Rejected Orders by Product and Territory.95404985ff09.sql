select *, t2.name as territory_name,t3.name as product_name from adventureworks_analytics.product_base_and_order_details2 t1
full join adventureworks_analytics.territory_names t2
on t1.territory_id= t2.territoryid
full join Production.Product t3
on t3.productid = t1.product_id
where t2.name in ('Southeast US','West US')
and t3.name not in ('ML Mountain Tire','Water Bottle - 30 oz.') limit 1000;
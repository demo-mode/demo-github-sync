select *, t2.name as territory_name,t3.name as product_name from adventureworks_analytics.product_base_and_order_details2 t1
full join sales.salesterritory t2
on t1.territory_id= t2.territoryid
full join Production.Product t3
on t3.productid = t1.product_id
where t2.name in ('Northwest','Southwest') limit 1000;
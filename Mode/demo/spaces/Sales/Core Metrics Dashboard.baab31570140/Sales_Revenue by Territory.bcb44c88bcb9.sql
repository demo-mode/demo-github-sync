select t2.name as "Territory Name" , t3.stateprovincename as "Province Name", total_due as "Total Revenue" , order_quantity as "Total Sales" from
adventureworks_analytics.Product_Base_and_order_details2 t1 full join sales.salesterritory t2
on t1.territory_id =t2.territoryid full join person.vstateprovincecountryregion  t3 on t1.territory_id =t3.territoryid
where extract(week from ship_date) = 1 and extract(year from ship_date) = 2017
and t2.name in ('Southeast','Southwest','Northwest','Central','Northeast')
and t3.stateprovincename in ('Washington','Oregon','New York','New Jersey','Massachusetts','Colorado','Illionis','Virginia','California','Texas','Florida');
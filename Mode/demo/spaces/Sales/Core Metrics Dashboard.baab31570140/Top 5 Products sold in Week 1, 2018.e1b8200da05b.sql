select t2.product_name as "Product Name", t2.product_category_name as "Product Category", count(t1.product_id) * 10 as "Units Sold", 'Week ' || extract(week from ship_date) || ', ' || extract(year from ship_date) as "Week" 
from adventureworks_analytics.product_base_and_order_details2 t1 full join adventureworks_analytics.product_base_table t2
on t1.product_id=t2.product_id
where extract(week from ship_date) = 1 and extract(year from ship_date) = 2018
group by 1,2,4
order by 3 desc
limit 5;
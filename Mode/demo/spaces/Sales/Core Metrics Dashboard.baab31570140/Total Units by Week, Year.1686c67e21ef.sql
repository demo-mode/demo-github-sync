select distinct(DATE_TRUNC ('week', ship_date)) as "week",
sum(order_quantity) * 100 as "Total Units"
from adventureworks_analytics.product_base_and_order_details2
where extract(year from ship_date) IN (2017,2018)
group by 1
order by 1;

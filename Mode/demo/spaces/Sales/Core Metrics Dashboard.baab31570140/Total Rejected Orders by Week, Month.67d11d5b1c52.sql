select distinct(DATE_TRUNC ('week', ship_date)) as "week",
count(order_status)*1000 as "Total Rejected Orders"
from adventureworks_analytics.product_base_and_order_details2
where extract(year from ship_date) IN (2017,2018) AND order_status = 'Rejected'
group by 1;
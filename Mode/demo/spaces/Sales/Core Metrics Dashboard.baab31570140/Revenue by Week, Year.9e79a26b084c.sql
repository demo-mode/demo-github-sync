select distinct(DATE_TRUNC ('week', ship_date)) as "week",
sum(total_due) * 1000 as "Total Revenue"
from adventureworks_analytics.product_base_and_order_details2
where extract(year from ship_date) IN (2017,2018)
group by 1
order by 1 ASC;
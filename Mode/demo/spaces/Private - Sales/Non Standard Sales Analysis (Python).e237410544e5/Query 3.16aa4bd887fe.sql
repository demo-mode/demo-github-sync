SELECT *,
       t2.name AS "Region",
       t3.name AS "State",
       total_due AS "Total Tickets",
       order_quantity AS "Tickets"
FROM adventureworks_analytics.Product_Base_and_order_details2 t1
full join sales.salesterritory t2
  ON t1.territory_id =t2.territoryid
full join person.stateprovince t3
  ON t1.territory_id =t3.territoryid
  WHERE extract(week
              FROM ship_date) = 1
    AND extract(year
                FROM ship_date) = 2016
    AND t3.name in ('New York',
                                 'California',
                                 'Georgia',
                                 'Tennessee')
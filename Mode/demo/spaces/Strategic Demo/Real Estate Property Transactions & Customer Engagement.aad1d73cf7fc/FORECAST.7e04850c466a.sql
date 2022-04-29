SELECT 
       sub.calc_date_no_use + 2800 AS date,
       count(sub.calc_date_no_use) AS id

    FROM (
SELECT 
       to_date(cast(last_sale_date as TEXT),'YYYY-MM-DD') AS calc_date_no_use
       
    FROM zhepu.sf_sold_homes 
      
) sub
GROUP BY 1
ORDER BY 1 ASC
SELECT *,
       sub.calc_date_no_use + 2800 AS date
      

    FROM (
SELECT 
       to_date(cast(last_sale_date as TEXT),'YYYY-MM-DD') AS calc_date_no_use,
       latitude AS lat,
       longitude AS lng
       
      FROM zhepu.sf_sold_homes 
      
) sub


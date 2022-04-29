SELECT *,
       sub.calc_date_no_use + 2800 AS date,
       ROW_NUMBER() OVER(ORDER BY sub.calc_date_no_use + 2800 ASC) AS Row

    FROM (
SELECT home_type,
       address,
       city,
       state,
       zip,
       list_price,
       beds,
       baths,
       location,
       sqft,
       year_built,
       parking_spots,
       parking_type,
       to_date(cast(last_sale_date as TEXT),'YYYY-MM-DD') AS calc_date_no_use,
       last_sale_price AS sale_price,
       url,
       source,
       listing_id,
       CASE WHEN length(original_source) > 2
       THEN left(original_source, 2)
       ELSE original_source END AS agents,
       latitude AS lat,
       longitude AS lng,
       is_short_sale,
       floor(random()*(90-20+1))+20 AS days_on_market
      FROM zhepu.sf_sold_homes 
      
) sub


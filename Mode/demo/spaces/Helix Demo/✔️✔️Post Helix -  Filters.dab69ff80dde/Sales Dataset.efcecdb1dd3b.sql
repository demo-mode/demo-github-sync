SELECT  * 
FROM  (SELECT d_year as year,
              i_category as category, 
              i_class as class, 
              i_brand as brand, 
                CASE
                WHEN s_store_name = 'able' THEN 'Walmart'
                WHEN s_store_name = 'anti' THEN 'Costco'
                WHEN s_store_name = 'ation' THEN 'Target'
                WHEN s_store_name = 'bar' THEN 'Safeway'
                WHEN s_store_name = 'cally' THEN 'Trader Joes'
                WHEN s_store_name = 'eing' THEN 'Whole Foods'
                WHEN s_store_name = 'ese' THEN 'Ross'
                WHEN s_store_name = 'n st' THEN 'Nordstrom'
                WHEN s_store_name = 'ought' THEN 'Dicks'
                WHEN s_store_name = 'pri' THEN 'Zara'
                ELSE 'NoStore' END as store_name,
              s_state as state, 
              d_moy as month, 
              Sum(ss_sales_price) sum_sales,
              Avg(Sum(ss_sales_price)) 
                OVER ( 
                  partition BY d_year, i_category, i_class, i_brand, s_store_name, s_state 
                ) 
                                  avg_monthly_sales 
                                 
       FROM roberto_salcido899.demoitemz i 
       JOIN modeanalytics.demostoresalvesv5 ss 
         ON ss_item_sk = i_item_sk 
       JOIN roberto_salcido899.demodates d 
         ON ss_sold_date_sk = d_date_sk 
       JOIN roberto_salcido899.demostores s 
         ON ss_store_sk = s_store_sk 
      
      WHERE i_category is NOT NULL
        AND i_class is NOT NULL
        AND i_brand is NOT NULL
        AND s_store_name is NOT NULL
        AND s_state is NOT NULL
       
      
      GROUP BY d_year,
                 i_category, 
                 i_class, 
                 i_brand, 
                 s_store_name, 
                 s_state, 
                 d_moy) tmp1 
                 
                 

ORDER BY sum_sales - avg_monthly_sales, 
          tmp1.store_name
          
          

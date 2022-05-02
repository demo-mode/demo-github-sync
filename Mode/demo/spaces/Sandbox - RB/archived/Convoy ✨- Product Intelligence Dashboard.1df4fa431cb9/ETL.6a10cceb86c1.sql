
WITH 

  
  top_industries as (
    SELECT *  
      FROM roberto_salcido899.solutionsdemoindustryranks
  ),
  
  user_days as (
    SELECT rp.time_id,
           m.member_id,
           m.industry as industry,
           COUNT(CASE WHEN m.is_engaged = TRUE THEN 1 END) as engaged_days_r28
      FROM roberto_salcido899.solutionsdemorollupperiods rp 
      JOIN roberto_salcido899.solutionsdemodailyactiveusersv2_sheet1 m 
        ON m.time_id >= rp.starts_at 
       AND m.time_id < rp.ends_at 
     WHERE rp.period_id = 1028
       AND rp.time_id >= '2018-01-01'
       AND rp.time_id < CURRENT_DATE 
     GROUP BY 1,2, 3
  )
  
    SELECT ud.time_id,
           CASE 
                WHEN ti.industry IS NULL THEN 'Unknown'
                WHEN ti.rank <= 5 THEN ti.industry
                ELSE 'Other'
           END as industry,
           ud.engaged_days_r28,
           CASE 
                WHEN ud.engaged_days_r28 >= 20 THEN '1- Power'
                WHEN ud.engaged_days_r28 >= 10 THEN '2- Frequent'
                WHEN ud.engaged_days_r28 >= 5 THEN '3- Occasional'
                ELSE '4- Infrequent'
           END as user_type,
           COUNT(ud.member_id) as users 
      FROM user_days ud 
      LEFT JOIN top_industries ti 
        ON ti.industry = ud.industry
     WHERE ud.engaged_days_r28 > 0 
     GROUP BY 1,2,3,4
     
     
     

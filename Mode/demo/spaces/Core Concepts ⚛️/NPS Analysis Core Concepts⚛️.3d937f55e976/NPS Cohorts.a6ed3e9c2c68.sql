  WITH 
  
  admin_status AS (
    SELECT 'd - Admin status' AS cohort_type,
           CASE 
                WHEN is_admin THEN '1 - True' 
                ELSE '2 - False' 
           END AS cohort,
           score_category,
           COUNT(DISTINCT user_id) AS responses,
           COUNT(CASE WHEN created_at >= CURRENT_TIMESTAMP - INTERVAL '28 DAY' THEN user_id ELSE NULL END) AS d28_responses
      FROM roberto_salcido899.solutionsdemonpsscoresv3
     GROUP BY 1,2,3
  ),


  org_size AS (
    SELECT 'c - Org size' AS cohort_type,
           CASE WHEN active_members IS NULL THEN '0 - No org'
                WHEN active_members <= 10 THEN '1 - Less than 10'
                WHEN active_members <= 50 THEN '2 - 11 - 50'
                WHEN active_members <= 100 THEN '3 - 51 - 100'
                WHEN active_members <= 500 THEN '4 - 101 - 500'
                WHEN active_members <= 1000 THEN '5 - 501 - 1000'
                ELSE '6 - More than 1000'
           END AS cohort,
           score_category,
           COUNT(DISTINCT user_id) AS responses,
           COUNT(CASE WHEN created_at >= CURRENT_TIMESTAMP - INTERVAL '28 DAY' THEN user_id ELSE NULL END) AS d28_responses
      FROM roberto_salcido899.solutionsdemonpsscoresv3
     GROUP BY 1,2,3
  ),
  
  plan_type AS (
    SELECT 'a - Plan type' AS cohort_type,
           CASE 
                WHEN plan_type = 'Plus Plan' THEN '1 - Plus'
                WHEN plan_type = 'Standard Plan' THEN '2 - Standard'
                ELSE '3 - No plan'
           END AS cohort,
           score_category,
           COUNT(DISTINCT user_id) AS responses,
           COUNT(CASE WHEN created_at >= CURRENT_TIMESTAMP - INTERVAL '28 DAY' THEN user_id ELSE NULL END) AS d28_responses
      FROM roberto_salcido899.solutionsdemonpsscoresv3
     GROUP BY 1,2,3
  ),

  sign_up_quarter AS (
    SELECT 'g - Quarter signed up' AS cohort_type,
           '0 - ' || EXTRACT(year FROM signed_up_quarter)::VARCHAR || ' Q' || EXTRACT(quarter FROM signed_up_quarter)::VARCHAR AS cohort,
           score_category,
           COUNT(DISTINCT user_id) AS responses,
           COUNT(CASE WHEN created_at >= CURRENT_TIMESTAMP - INTERVAL '28 DAY' THEN user_id ELSE NULL END) AS d28_responses
      FROM roberto_salcido899.solutionsdemonpsscoresv3
     GROUP BY 1,2,3
  ),
  
  user_age AS (
    SELECT 'f - User age' AS cohort_type,
           CASE WHEN age_in_days <= 7 THEN '1 - Less than a week'
                WHEN age_in_days <= 28 THEN '2 - Less than a month'
                WHEN age_in_days <= 168 THEN '3 - Less than a 6 months'
                WHEN age_in_days <= 365 THEN '4 - Less than a year'
                ELSE '5 - Over a year'
           END AS cohort,
           score_category,
           COUNT(DISTINCT user_id) AS responses,
           COUNT(CASE WHEN created_at >= CURRENT_TIMESTAMP - INTERVAL '28 DAY' THEN user_id ELSE NULL END) AS d28_responses
      FROM roberto_salcido899.solutionsdemonpsscoresv3
     GROUP BY 1,2,3
  ),
  
  combined AS (
    SELECT * FROM plan_type UNION ALL
    SELECT * FROM org_size UNION ALL
    SELECT * FROM admin_status UNION ALL
    SELECT * FROM user_age UNION ALL
    SELECT * FROM sign_up_quarter 
  ),
  
  pivoted AS (
    SELECT cohort_type,
           cohort,
           SUM(responses) AS responses,
           SUM(d28_responses) AS d28_responses,
           SUM(CASE WHEN score_category = 'promoter'  THEN responses ELSE NULL END) AS promoters,
           SUM(CASE WHEN score_category = 'passive'   THEN responses ELSE NULL END) AS passives,
           SUM(CASE WHEN score_category = 'detractor' THEN responses ELSE NULL END) AS detractors,
           SUM(CASE WHEN score_category = 'promoter'  THEN d28_responses ELSE NULL END) AS d28_promoters,
           SUM(CASE WHEN score_category = 'passive'   THEN d28_responses ELSE NULL END) AS d28_passives,
           SUM(CASE WHEN score_category = 'detractor' THEN d28_responses ELSE NULL END) AS d28_detractors
      FROM combined
     GROUP BY 1,2
  ),
  
  percentages AS (
    SELECT *,
           coalesce(promoters,0)/GREATEST(responses,1) AS promoter_pct,
           coalesce(passives,0)/GREATEST(responses,1) AS passive_pct,
           coalesce(detractors,0)/GREATEST(responses,1) AS detractor_pct,
           coalesce(d28_promoters,0)/GREATEST(d28_responses,1) AS d28_promoter_pct,
           coalesce(d28_passives,0)/GREATEST(d28_responses,1) AS d28_passive_pct,
           coalesce(d28_detractors,0)/GREATEST(d28_responses,1) AS d28_detractor_pct
      FROM pivoted
  ),
  
  metrics AS (
    SELECT *,
           promoter_pct - detractor_pct AS nps,
           d28_promoter_pct - d28_detractor_pct AS d28_nps
          -- https://verstaresearch.com/blog/how-to-calculate-an-nps-margin-of-error/
       
      FROM percentages
  )
  
  SELECT cohort_type AS ordered_cohort_type,
         cohort AS ordered_cohort,
         SUBSTR(cohort_type,4) AS cohort_type,
         SUBSTR(cohort,4) AS cohort,
         responses AS "Responses",
         d28_responses AS "Responses (28d)",
         promoters,
         passives,
         detractors,
         d28_promoters,
         d28_passives,
         d28_detractors,
         abs(nps*100) AS "NPS",
         abs(d28_nps*100) AS "NPS (28d)"
    FROM metrics
    WHERE RESPONSES > 35
    
   ORDER BY 1,2
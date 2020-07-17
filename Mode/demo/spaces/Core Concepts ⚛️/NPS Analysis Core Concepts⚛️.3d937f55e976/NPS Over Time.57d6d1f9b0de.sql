  WITH categories AS (
    SELECT score_category
      FROM roberto_salcido899.solutionsdemonpsscoresv3
     GROUP BY 1
  ),
  
  updated_rollup AS (
    SELECT period_id,
           time_id,
           CASE WHEN period_id = 1 THEN '2010-01-01' ELSE starts_at END AS starts_at,
           ends_at
      FROM roberto_salcido899.solutionsdemorollupperiodsv3
  ),
  
  drp_90 AS (
    SELECT 1090 AS period_id,
           time_id,
           starts_at - INTERVAL '62 DAY' AS starts_at,
           ends_at
      FROM updated_rollup
     WHERE period_id = 1028
  ),
  
  combined_rollup AS (
    SELECT * FROM updated_rollup
     UNION ALL
    SELECT * FROM drp_90
  ),

  rollup_nps AS (
    SELECT drp.period_id,
           drp.time_id,
           c.score_category,
           COUNT(DISTINCT n.user_id) AS responses
      FROM combined_rollup drp
      JOIN categories c
        ON c.score_category IS NOT NULL
      LEFT JOIN roberto_salcido899.solutionsdemonpsscoresv3 n
        ON n.created_at >= drp.starts_at
       AND n.created_at <  drp.ends_at
       AND n.score_category = c.score_category
     WHERE drp.period_id IN (1,1007,1028,1090)
       AND drp.time_id >= '2019-03-01'
       AND drp.time_id <= CURRENT_TIMESTAMP
     GROUP BY 1,2,3
  ),
  
  pivoted AS (
    SELECT period_id,
           time_id,
           SUM(responses) AS responses,
           SUM(CASE WHEN score_category = 'promoter'  THEN responses ELSE NULL END) AS promoters,
           SUM(CASE WHEN score_category = 'passive'   THEN responses ELSE NULL END) AS passives,
           SUM(CASE WHEN score_category = 'detractor' THEN responses ELSE NULL END) AS detractors
      FROM rollup_nps
     GROUP BY 1,2
  ),
  
  percentages AS (
    SELECT *,
           COALESCE(promoters,0)/GREATEST(responses,1) AS promoter_pct,
           COALESCE(passives,0)/GREATEST(responses,1) AS passive_pct,
           COALESCE(detractors,0)/GREATEST(responses,1) AS detractor_pct
      FROM pivoted
  ),
  
  metrics AS (
    SELECT *,
           promoter_pct - detractor_pct AS nps
          -- https://verstaresearch.com/blog/how-to-calculate-an-nps-margin-of-error/
        
      FROM percentages
  )
  
  SELECT CASE 
              WHEN period_id = 1 THEN 'All time'
              WHEN period_id = 1007 THEN 'Previous 7 days'
              WHEN period_id = 1028 THEN 'Previous 28 days'
              WHEN period_id = 1090 THEN 'Previous 90 days'
              ELSE 'WTF LOL'
         END AS period_id,
         time_id,
         responses AS "Responses",
         promoters,
         passives,
         detractors,
         nps*100 AS "NPS"
    FROM metrics
    WHERE RESPONSES > 10
   ORDER BY 1,2
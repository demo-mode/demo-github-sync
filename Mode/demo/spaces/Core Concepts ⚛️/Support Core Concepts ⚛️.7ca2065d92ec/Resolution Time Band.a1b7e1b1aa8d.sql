SELECT a.NAME,
          c.id,
          MIN(c.created_at) AS created_at,
          MAX(CASE
                  WHEN part_type = 'close' THEN p.created_at
                  ELSE NULL
              END) AS CLOSE_DATE
   FROM roberto_salcido899.solutionsdemointercomconvopartsv2 p
   JOIN roberto_salcido899.solutionsintercomconvosv2 c
     ON p.conversation_id = c.ID
   JOIN roberto_salcido899.solutionsdemointercomadminv3_sheet1 a
     ON a.ID = c.ASSIGNEE_ID
     AND part_type ='close'
     
     AND EXTRACT(dow
                 FROM p.created_at) NOT IN (0,6)
   GROUP BY 1,
            2
   ORDER BY 4 DESC
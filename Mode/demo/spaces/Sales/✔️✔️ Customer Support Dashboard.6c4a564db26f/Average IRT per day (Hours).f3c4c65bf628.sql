
  SELECT
    c.id,
    c.assignee_id,
    c.created_at,
    MIN(p.created_at) AS assignment_date
  FROM
  roberto_salcido899.solutionsintercomconvosv2 c     
  JOIN roberto_salcido899.solutionsdemointercomconvopartsv2 p ON p.conversation_id = c.id 
  
   
    AND EXTRACT(dow FROM c.created_at) NOT IN (0,6)
    AND DATE_PART('Hour', c.created_at) BETWEEN 7 AND 18
  GROUP BY 1,2,3
  ORDER BY 2
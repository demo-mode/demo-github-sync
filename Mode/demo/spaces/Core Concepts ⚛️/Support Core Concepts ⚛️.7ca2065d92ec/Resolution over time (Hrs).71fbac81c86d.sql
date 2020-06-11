WITH

conversations AS (
  SELECT
    c.id,
    c.assignee_id,
    c.created_at,
    MIN(cp.created_at) AS closed_date
  FROM
    roberto_salcido899.solutionsintercomconvosv2  c
    JOIN roberto_salcido899.solutionsdemointercomconvopartsv2 cp ON cp.conversation_id = c.id AND cp.part_type = 'close'
     
  GROUP BY 1,2,3
  ORDER BY 2
)

SELECT
  
  TO_CHAR(DATE_TRUNC('Day', c.created_at), 'MM-DD-YYYY (Dy)') AS "DY_DATE",
  DATE_TRUNC('Day', c.created_at) AS "DATE",
 
 DATE_PART('day', c.closed_date::timestamp - c.created_at::timestamp) * 24 + 
              DATE_PART('hour', c.closed_date::timestamp - c.created_at::timestamp) AS "RESOLUTION_TIME",
 COUNT(c.id) AS "TOTAL_CONVERSATIONS"
FROM
  conversations c
WHERE
  EXTRACT(dow FROM c.created_at) NOT IN (6,0)
  AND DATE_PART('Hour', c.created_at) BETWEEN 7 AND 18
GROUP BY 1, 2, 3
ORDER BY 1
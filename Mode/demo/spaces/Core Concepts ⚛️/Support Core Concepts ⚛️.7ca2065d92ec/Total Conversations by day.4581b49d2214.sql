SELECT a.NAME,
date_trunc('day', c.created_at) as created_at,
count(c.id) as count
FROM roberto_salcido899.solutionsintercomconvosv2 C
JOIN roberto_salcido899.solutionsdemointercomadminv3_sheet1 A
  ON a.ID = c.ASSIGNEE_ID

group by 1, 2
ORDER BY count


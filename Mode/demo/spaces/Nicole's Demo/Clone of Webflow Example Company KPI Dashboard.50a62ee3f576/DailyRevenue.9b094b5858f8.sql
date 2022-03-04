select *, CASE 
                WHEN time_id = CURRENT_DATE THEN 'Current'
                WHEN time_id < CURRENT_DATE THEN 'Historic'
                ELSE 'Future'
           END as time_category
from roberto_salcido899.solutionsdemodailyrevenue
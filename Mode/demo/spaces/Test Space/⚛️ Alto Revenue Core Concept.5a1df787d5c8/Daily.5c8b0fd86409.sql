SELECT setseed(0.5);
WITH
account_cats as (
select accountname,
       random() as vertical_sort,
       random()  as region_sort
    from roberto_salcido899.solutionsdemodailyrevenue r
   where  time_id = CURRENT_DATE
)

select r.*, CASE 
                WHEN time_id = CURRENT_DATE THEN 'Current'
                WHEN time_id < CURRENT_DATE THEN 'Historic'
                ELSE 'Future'
           END as time_category,
           a.vertical_sort,
           a.region_sort
from roberto_salcido899.solutionsdemodailyrevenue r
JOIN account_cats a 
  ON a.accountname = r.accountname
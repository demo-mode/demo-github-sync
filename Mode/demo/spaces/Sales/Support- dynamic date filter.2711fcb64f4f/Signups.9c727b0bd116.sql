select id, activated_at,
CASE
              WHEN ACTIVATED_AT > current_timestamp - interval '7 day' THEN 'rolling7'
              WHEN ACTIVATED_AT > current_timestamp - interval '28 day'THEN 'rolling28'
              WHEN ACTIVATED_AT > current_timestamp - interval '90 day' THEN 'rolling90'
              ELSE 'beyond90'
              END as rollingdate


from roberto_salcido899.solutionsdemosampleusers
where activated_at is not null
order by activated_at desc
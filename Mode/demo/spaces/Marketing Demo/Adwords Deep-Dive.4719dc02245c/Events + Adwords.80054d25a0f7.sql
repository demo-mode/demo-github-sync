SELECT distinct(t1.user_id),
       t1.location,
       t2.theme,
       t2.signup,
       t2.message,
       CASE
           WHEN t2.signup = 'Yes' then 200
           ELSE 0
       END AS revenue,
       CASE
           WHEN t2.theme = 'Workflow' then 11
           WHEN t2.theme = 'Speed' then 7
           WHEN t2.theme = 'Embed' then 13
           WHEN t2.theme = 'Collaboration' then 11
           WHEN t2.theme = 'Governance' then 12
           ELSE 0
       END AS cost
FROM sadavath.events_demo t1
RIGHT JOIN sadavath.adwords_rollup_demo t2
  ON t1.user_id = t2.user_id
  AND t1.channel = 'adwords'
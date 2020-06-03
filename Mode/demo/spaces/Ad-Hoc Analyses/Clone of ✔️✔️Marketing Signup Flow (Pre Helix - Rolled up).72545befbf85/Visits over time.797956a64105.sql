with model_cte AS
  (SELECT t1.user_id,
          t1.occurred_at,
          t1.event_type,
          t1.event_name,
          t1.location,
          t1.device,
          t1.channel,
          t2.name,
          t2.email_address,
          t2.message,
          t2.theme,
          t2.signup,
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
   FROM sadavath.demo_marketing t1
   full JOIN sadavath.adwords_rollup_demo t2
     ON t1.user_id = t2.user_id)
     
     

SELECT count (distinct(user_id)), date_trunc('week', occurred_at) AS week,
                                  channel
FROM model_cte
  WHERE
  location IN ('Australia',
               'Brazil',
               'France',
               'Germany',
               'India',
               'Japan',
               'United Kingdom',
               'United States')
  AND event_type = 'signup_flow'
  AND occurred_at >= '2019-07-15'
GROUP BY 2,
         3
SELECT t1.user_id,
       t1.occurred_at,
       t1.channel
FROM sadavath.demo_marketing t1
full JOIN sadavath.adwords_rollup_demo t2
  ON t1.user_id = t2.user_id
where location IN ('Australia','Brazil','France','Germany','India','Japan','United Kingdom','United States')
and event_type = 'signup_flow'
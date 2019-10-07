SELECT t1.user_id,
       t1.event_name,
       t1.occurred_at,
       t1.channel
FROM sadavath.demo_marketing t1
full JOIN sadavath.adwords_rollup_demo t2
  ON t1.user_id = t2.user_id
where event_type = 'signup_flow'
and t1.occurred_at >= timestamp '2019-10-01'
  and t1.occurred_at <= timestamp '2019-11-14';
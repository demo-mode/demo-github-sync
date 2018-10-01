select date_trunc('day',occurred_at) as day,
       event_type,
       count(*)
  from benn.fake_fact_events 
 group by 1,2
 order by 1
LIMIT 100
select date_trunc('day',occurred_at) as day,
       count(*)
  from benn.fake_fact_events 
 group by 1
 order by 1

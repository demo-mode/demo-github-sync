select date_trunc('day',occurred_at) as day,
       count(*) AS events
  from benn.fake_fact_events 
 where occurred_at < '2014-06-01'
 group by 1
 order by 1
select date_trunc('day',occurred_at) as day,
        event_type,
       count(*) AS metric
  from benn.fake_fact_events 
 where occurred_at < '2014-06-01'
 group by 1,2
 order by 1
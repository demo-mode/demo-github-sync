    SELECT TO_CHAR(occurred_at,'YYYY')as year,
    TO_CHAR(occurred_at,'MM')as month,
    COUNT(*)
      FROM demo.web_events_full 
      where occurred_at <= '2017-01-01'
      group by 1,2
      order by 1,2
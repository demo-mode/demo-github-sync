WITH 

users AS (
  SELECT user_id,
         MIN(occurred_at) AS activated_at
    FROM modeanalytics.retention_events 
   WHERE occurred_at <= NOW()
   GROUP BY 1
),
  
events AS (
  SELECT user_id,
         event_name,
         occurred_at
    FROM modeanalytics.retention_events 
   WHERE occurred_at <= NOW()
),

last_activation AS (
  SELECT MAX(activated_at) AS last_activation
  FROM users
)

SELECT *
  FROM (
SELECT *,
       MAX(CASE WHEN user_period = 0 THEN retained_users ELSE NULL END) OVER (PARTITION BY "Signup Date") AS "New Users",
       
       retained_users/
          MAX(CASE WHEN user_period = 0 THEN retained_users ELSE NULL END) OVER (PARTITION BY "Signup Date")::FLOAT AS retention_rate,
          
       (LAG(retained_users) OVER (PARTITION BY "Signup Date" ORDER BY "Signup Date") - retained_users)/
          MAX(CASE WHEN user_period = 0 THEN retained_users ELSE NULL END) OVER (PARTITION BY "Signup Date")::FLOAT AS churn_rate,
      
       (LAG(retained_users) OVER (PARTITION BY "Signup Date" ORDER BY "Signup Date") - retained_users)/
          LAG(retained_users) OVER (PARTITION BY "Signup Date" ORDER BY "Signup Date")::FLOAT AS churn_rate_from_previous_period
  FROM (
  
SELECT DATE_TRUNC('{{time_interval}}',u.activated_at) + INTERVAL '900 DAY' AS "Signup Date",

{% if time_interval == 'month' %}
       (EXTRACT('year' FROM e.occurred_at) - EXTRACT('year' FROM u.activated_at)) * 12 + 
       (EXTRACT('month' FROM e.occurred_at) - EXTRACT('month' FROM u.activated_at)) - 
       CASE WHEN (CEILING(DATE_PART('day',e.occurred_at) - DATE_PART('day',u.activated_at))) < 0 THEN 1 ELSE 0 END AS user_period,
{% elsif time_interval == 'week' %}
       TRUNC(DATE_PART('day',e.occurred_at - u.activated_at)/7) AS user_period,
{% endif %}
       COUNT(DISTINCT e.user_id) AS retained_users
  FROM users u
  JOIN events e
    ON e.user_id = u.user_id
   AND e.occurred_at >= u.activated_at 
NATURAL JOIN last_activation a
  WHERE u.activated_at >= DATE_TRUNC('{{time_interval}}',a.last_activation) - INTERVAL '25 {{time_interval}}'
 GROUP BY 1,2
     ) x
     ) z
 WHERE user_period != 0
 ORDER BY 1,2

{% form %}

time_interval:
  type: select
  default: month
  options: [[week, week],
            [month, month]
           ]
           
{% endform %}
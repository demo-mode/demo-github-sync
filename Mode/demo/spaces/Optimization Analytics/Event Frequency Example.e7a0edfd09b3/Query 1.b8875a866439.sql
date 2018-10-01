WITH 

users AS (

  SELECT user_id,
         activated_at
    FROM tutorial.playbook_users
),

events AS (
  SELECT user_id,
         event_name,
         occurred_at
    FROM tutorial.playbook_events
)

SELECT time_id,

{% if metric == 'number of users' %}

       home_page_visits_users AS home_page_visits,
       searches_users AS searches,
       messages_users AS messages,
       like_message_users AS like_messages,
       view_inbox_users AS view_inbox

{% elsif metric == 'number of events' %}
      
       home_page_visits,
       searches,
       messages,
       like_messages,
       view_inbox

{% elsif metric == 'average times used per user' %}

       home_page_visits/CASE WHEN home_page_visits_users = 0 THEN 1 ELSE home_page_visits_users END::FLOAT AS home_page_visits,
       searches/CASE WHEN searches_users = 0 THEN 1 ELSE searches_users END::FLOAT AS searches,
       messages/CASE WHEN messages_users = 0 THEN 1 ELSE messages_users END::FLOAT AS messages,
       like_message/CASE WHEN like_message_users = 0 THEN 1 ELSE like_message_users END::FLOAT AS like_messages,
       view_inbox/CASE WHEN view_inbox_users = 0 THEN 1 ELSE view_inbox_users END::FLOAT AS view_inbox

{% endif %}
       
  FROM (
SELECT DATE_TRUNC('{{time_interval}}',e.occurred_at) AS time_id,
       COUNT(DISTINCT CASE WHEN e.event_name = 'home_page' THEN e.user_id ELSE NULL END) AS home_page_visits_users,
       COUNT(DISTINCT CASE WHEN e.event_name = 'search_run' THEN e.user_id ELSE NULL END) AS searches_users,
       COUNT(DISTINCT CASE WHEN e.event_name = 'send_message' THEN e.user_id ELSE NULL END) AS messages_users,
       COUNT(DISTINCT CASE WHEN e.event_name = 'like_message' THEN e.user_id ELSE NULL END) AS like_message_users,
       COUNT(DISTINCT CASE WHEN e.event_name = 'view_inbox' THEN e.user_id ELSE NULL END) AS view_inbox_users,
       COUNT(CASE WHEN e.event_name = 'home_page' THEN e.user_id ELSE NULL END) AS home_page_visits,
       COUNT(CASE WHEN e.event_name = 'search_run' THEN e.user_id ELSE NULL END) AS searches,
       COUNT(CASE WHEN e.event_name = 'send_message' THEN e.user_id ELSE NULL END) AS messages,
       COUNT(CASE WHEN e.event_name = 'like_message' THEN e.user_id ELSE NULL END) AS like_message,
       COUNT(CASE WHEN e.event_name = 'view_inbox' THEN e.user_id ELSE NULL END) AS view_inbox
  FROM users u
  JOIN events e
    ON e.user_id = u.user_id
   AND e.occurred_at >= '{{start_date}}'
   AND e.occurred_at <= '{{end_date}}'
 GROUP BY 1
 ORDER BY 1
       ) z
    

{% form %}

start_date:
  type: text
  default: 2014-01-01

end_date:
  type: text
  default: 2014-10-31

time_interval:
  type: select
  options: [['day','day'],
            ['week','week'],
            ['month','month']]
  default: day

metric:
  type: select
  options: [['number of users','number of users'],
            ['number of events','number of events'],
            ['average times used per user','average times used per user']]
  default: 'number of users'
  
{% endform %}
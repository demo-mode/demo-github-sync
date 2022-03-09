select user_id, occurred_at, event_type, event_name, location, device, channel, signup, revenue, cost
from roberto_salcido899.marketingcalcfields
order by occurred_at, channel
limit 1000000
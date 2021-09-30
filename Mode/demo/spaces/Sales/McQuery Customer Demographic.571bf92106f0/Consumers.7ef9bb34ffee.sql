SELECT 
  c.first_name,
  c.last_name,
  c.email,
  c.member_since,
  c.gender,
  c.state,
  c.home_address_latitude,
  c.home_address_longitude,
  c.has_favorite_meal,
  c.customer_lifetime_revenue,
  c.uses_app
FROM mode_onboarding.mcquery_consumers c
JOIN mode_onboarding.mcquery_restaurants r
ON c.fav_restaurant = r.location_id
--WHERE r.location_id LIKE '{{store_number}}'

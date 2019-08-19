SELECT destination_airport,
       first_class_rev,
       coach_rev,
       (first_class_rev *.008)::integer as flights
  FROM tutorial.flight_revenue
  ORDER BY 4 DESC
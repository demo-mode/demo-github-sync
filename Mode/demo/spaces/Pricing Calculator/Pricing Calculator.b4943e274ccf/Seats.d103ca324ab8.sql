SELECT SUM(unit_price)
FROM mode.seats
WHERE seat_count >= {{ seats }}

{% form %}

seats:
    type: text
    default: 10

{% endform %}
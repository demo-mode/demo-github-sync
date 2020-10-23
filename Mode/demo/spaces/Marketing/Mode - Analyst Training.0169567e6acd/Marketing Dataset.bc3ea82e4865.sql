SELECT *
FROM carloshernandez.marketing_demo
WHERE occurred_at > '{{start_date}}'
AND occurred_at < '{{ end_date }}'
 
 {% form %}

start_date:
    type: date
    default: 2019-08-01
    description: "This is the start date"
    
end_date:
    type: date
    default: 2019-12-01
    description: "This is the end date"

{% endform %}

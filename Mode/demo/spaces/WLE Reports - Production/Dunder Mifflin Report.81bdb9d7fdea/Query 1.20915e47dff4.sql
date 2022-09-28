SELECT * FROM customer_1.Dunder_Mifflin
WHERE status LIKE 'COMPLETED'
AND business_size > {{ business_size }} 

{% form %}

business_size:
    type: text
    default: 501

{% endform %}
SELECT account_id 
FROM demo.orders
{% form %}
id:
	type: select
	default: 1001
	options:
		values: account_id
		labels: account_id
{% endform %}
SELECT *
FROM customer_1.Dunder_Mifflin
WHERE purchased_at > '{{purchase_start_date}}'
AND purchased_at < '{{purchase_end_date}}'
AND account_manager = 'Angela Martin'

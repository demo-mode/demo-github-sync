-- Returns first 100 rows from tutorial.accounts
  SELECT 
		id,
		name,
		primary_contact,
		sales_rep_id,
		region_id
 FROM tutorial.accounts LIMIT 100;
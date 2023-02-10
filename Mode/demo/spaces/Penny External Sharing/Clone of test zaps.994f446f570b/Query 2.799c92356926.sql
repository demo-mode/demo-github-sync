-- Returns first 100 rows from public.menus
  SELECT 
		restaurant_id,
		category,
		name,
		description,
		price
 FROM public.menus LIMIT 100;
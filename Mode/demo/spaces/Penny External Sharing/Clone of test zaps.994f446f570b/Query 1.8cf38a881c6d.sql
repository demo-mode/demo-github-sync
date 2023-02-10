-- Returns first 100 rows from tutorial.aapl_historical_stock_price
  SELECT 
		date,
		year,
		month,
		open,
		high,
		low,
		close,
		volume,
		id
 FROM tutorial.aapl_historical_stock_price LIMIT 100;
 # Convert invoice_date column type from string to datetime
df['day'] = pd.to_datetime(df['day'])
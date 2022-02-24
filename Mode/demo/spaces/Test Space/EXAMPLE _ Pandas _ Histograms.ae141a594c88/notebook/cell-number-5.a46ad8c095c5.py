# Data type conversions
df['created_at'] = df['created_at'].astype('datetime64[ns]')
df['user_type'] = df['user_type'].astype('category')

# Show new data types
df.dtypes
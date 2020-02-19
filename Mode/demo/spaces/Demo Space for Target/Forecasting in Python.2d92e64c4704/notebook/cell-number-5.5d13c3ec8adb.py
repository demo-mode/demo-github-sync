# Explicitly cast "date" column to datetime64[ns] dtype
df['date'] = df['date'].astype('datetime64[ns]')

df.dtypes
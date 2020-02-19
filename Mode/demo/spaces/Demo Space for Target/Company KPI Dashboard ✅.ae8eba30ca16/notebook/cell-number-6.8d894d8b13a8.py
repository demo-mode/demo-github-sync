# Create new ds column from date
df['ds'] = df['date']

# Create new y column from value
df['y'] = df['value']

# Repurpose date column to be used as dataframe index
df = df.set_index("date")

df.tail()
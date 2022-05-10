import pandas
import matplotlib
datasets
df = datasets[0]
df['created_at'] = df['created_at'].astype('datetime64[ns]')
df['user_type'] = df['user_type'].astype('category')
df.hist(column='session_duration_seconds', bins=35, grid=False, color='#755fe8', figsize=(10,4))
;
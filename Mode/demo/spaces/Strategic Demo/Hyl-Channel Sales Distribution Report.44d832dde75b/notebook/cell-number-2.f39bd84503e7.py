import pandas
import matplotlib
datasets
df = datasets[0]
df['created_at'] = df['created_at'].astype('datetime64[ns]')
df['user_type'] = df['user_type'].astype('category')
df.hist(column='session_duration_seconds', grid=False, figsize=(12,8), color = "#6abf4b")
;
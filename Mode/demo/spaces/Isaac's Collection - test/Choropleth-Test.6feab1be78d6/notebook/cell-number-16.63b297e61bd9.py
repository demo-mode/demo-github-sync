#df name
df_new = df[df['STNAME'].isin(scope)]

# list values
values = df_new['TOT_POP'].tolist()
fips = df_new['FIPS'].tolist()
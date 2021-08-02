from scipy.stats import boxcox

# Apply Box-Cox Transform to value column and assign to new column y
df['y'], lam = boxcox(df['count_company_id'])

import fbprophet
m = fbprophet.Prophet()
m.fit(df)
future = m.make_future_dataframe(periods=365)
forecast = m.predict(future)
m.plot(forecast);
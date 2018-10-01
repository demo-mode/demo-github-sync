# Grab SQL Results
daily = datasets["Sales by SKU"]

day = pd.to_datetime(daily['day'])
sales = daily['sales']
rolling = pd.rolling_mean(daily['sales'], 2, 0)

idx = daily.index
idx = np.array(idx, dtype=float)

future = pd.Series(pd.date_range(day.min(),day.max() + pd.DateOffset(30)))
future_idx = future.index
future_idx = np.array(future_idx, dtype=float)

z = np.polyfit(idx, rolling, 1)
p = np.poly1d(z)
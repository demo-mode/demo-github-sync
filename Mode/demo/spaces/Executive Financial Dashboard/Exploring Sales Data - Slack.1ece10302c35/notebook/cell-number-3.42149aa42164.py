rolling = pd.rolling_mean(daily['metric'], 7, 0)

idx = daily.index
idx = np.array(idx, dtype=float)

days_to_forecast =30

future = pd.Series(pd.date_range(day.min(),day.max() + pd.DateOffset(days_to_forecast)))
future_idx = future.index
future_idx = np.array(future_idx, dtype=float)

z = np.polyfit(idx, rolling, 1)
p = np.poly1d(z)

plt.plot(day, rolling)
plt.plot(future, p(future_idx))

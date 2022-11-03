rolling = daily['orders'].rolling(7,0).mean()

idx = daily.index
idx = np.array(idx, dtype=float)

future = pd.Series(pd.date_range(day.min(),day.max() + pd.DateOffset(90)))
future_idx = future.index
future_idx = np.array(future_idx, dtype=float)

z = np.polyfit(idx, rolling, 1)
p = np.poly1d(z)

plt.plot(day, rolling)
plt.plot(future, p(future_idx))
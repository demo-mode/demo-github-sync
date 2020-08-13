#Get predictions for validation period
future = m.make_future_dataframe(periods = forecast_length_days)
forecast = m.predict(future)

df1 = forecast[forecast['ds']<'2019-12-26 00:00:00']
df2 = forecast[forecast['ds']>'2019-12-25 00:00:00']
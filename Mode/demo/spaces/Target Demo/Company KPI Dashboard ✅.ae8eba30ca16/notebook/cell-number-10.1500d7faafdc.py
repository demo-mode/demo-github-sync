# Instantiate Prophet object
m = fbprophet.Prophet()

# Call fit method on Prophet object and pass in prepared dataframe. This is where model fitting is performed
m.fit(df)

# Create a dataframe with ds extending the chosen number of periods into the future
future = m.make_future_dataframe(periods=int(datasets["Days Out"].days_out))

# Create the forecast
forecast = m.predict(future)

forecast.tail()
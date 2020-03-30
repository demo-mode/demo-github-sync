import datetime as dt 

today =dt.datetime.today().strftime("%Y/%m/%d")
forecast_copy = forecast [['yhat']].copy()

Actual = forecast_copy['2017-11-01':today]
Actual1 = Actual.reset_index()

Forecast = forecast_copy[today:]
Forecast1 = Forecast.reset_index()
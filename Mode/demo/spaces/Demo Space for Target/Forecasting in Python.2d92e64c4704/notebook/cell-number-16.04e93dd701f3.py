# Apply inverse Box-Cox transform to specific columns
forecast[['yhat','yhat_upper','yhat_lower']] = forecast[['yhat','yhat_upper','yhat_lower']].apply(lambda x: inv_boxcox(x, lam))
forecast = forecast[['ds','yhat','yhat_lower','yhat_upper']]
forecast = forecast.set_index('ds')

forecast.tail()
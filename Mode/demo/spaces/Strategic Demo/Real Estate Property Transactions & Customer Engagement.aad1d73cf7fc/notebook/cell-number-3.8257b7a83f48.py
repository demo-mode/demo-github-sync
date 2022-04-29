#FORECAST OF PROPERTY SALES FOR FIRST HALF
#Libraries
import pandas as pd
from prophet import Prophet
#Dataset
df1 = datasets[3]
#Change to date to datetime
df1 ['date'] = pd.to_datetime(df1 ['date'])
#Rename Columns for Forecast
df1.columns = ['ds', 'y']
#Create Instance of Prophet
p = Prophet(interval_width=0.92, daily_seasonality=True)
#Training The Model
model = p.fit(df1)
#Make Predections
future = p.make_future_dataframe(periods=150, freq='D')
forecast_prediction = p.predict(future)
#Visualize Predection
plot1 = p.plot(forecast_prediction)
#FORECAST COMOPONENTS IF NEEDED
#plot2 = p.plot_components(forecast_prediction)
training_data = datasets['Forecast']
training_data['ds'] = pd.to_datetime(training_data['ds'])
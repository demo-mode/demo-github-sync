#Fit model
m = Prophet(interval_width = 0.95)
m.fit(training_data)
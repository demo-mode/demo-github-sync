# Train the logistic regression model

# Set the model paramters
logReg_model = LogisticRegression(solver = 'liblinear', random_state = 0, class_weight='balanced') 
# For small datasets, solver = ‘liblinear’ is a good choice
# The “balanced” mode uses the values of y to automatically adjust weights inversely proportional 
# to class frequencies in the input data as n_samples / (n_classes * np.bincount(y)).

# Fit the model to X and y training data
logReg_model.fit(X_train, y_train)
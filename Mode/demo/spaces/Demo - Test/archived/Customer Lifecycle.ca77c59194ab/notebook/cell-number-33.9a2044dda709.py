#dropping total charges 
X_train = X_train.drop(columns=['total_charges'])
X_test = X_test.drop(columns=['total_charges'])
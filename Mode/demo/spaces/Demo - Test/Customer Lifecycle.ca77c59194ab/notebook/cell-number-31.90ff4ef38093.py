# Transform features by scaling each feature to be between [0, 1]
#scale = StandardScaler() # dont use Standard scalar because binary variables should stay binary
scale = MinMaxScaler()

X_train2 = pd.DataFrame(scale.fit_transform(X_train))
X_train2.columns = X_train.columns.values
X_train2.index = X_train.index.values
X_train = X_train2

X_test2 = pd.DataFrame(scale.transform(X_test))
X_test2.columns = X_test.columns.values
X_test2.index = X_test.index.values
X_test = X_test2
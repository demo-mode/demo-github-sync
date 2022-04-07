# split data into response and predictors
y = churn3['churn']
X = churn3.drop(columns = 'churn')
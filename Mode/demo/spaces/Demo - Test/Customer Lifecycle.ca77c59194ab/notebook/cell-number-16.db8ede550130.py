# Categorical variables with 2 or less values will be binary encoded
churn['churn'].value_counts()
# note that dataset is imbalanced with fewer churn than not churn
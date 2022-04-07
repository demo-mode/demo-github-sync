# Categorical variables with more than 2 categories can be encoded using one-hot encoding
# 'multiple_lines', 'internet_service', 'online_security', 'online_backup', 'device_protection', 'tech_support', 'streaming_tv', etc
churn3 = pd.get_dummies(churn2)
churn3 # updated from 19 columns in churn2 to 38 columns in churn3
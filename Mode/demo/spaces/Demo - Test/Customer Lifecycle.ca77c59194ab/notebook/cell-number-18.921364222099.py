#Create a label encoder object
le = LabelEncoder()
cat2 = []
# Label Encoding will be used for columns with 2 or less unique values
count = 0
for col in churn2.columns:
  if churn2[col].dtype == 'object':
    if len(list(churn2[col].unique())) <= 2:
      cat2.append(col)
      print(col)
      le.fit(churn2[col])
      churn2[col] = le.transform(churn2[col])
      count += 1
print('{} columns were label encoded.'.format(count))
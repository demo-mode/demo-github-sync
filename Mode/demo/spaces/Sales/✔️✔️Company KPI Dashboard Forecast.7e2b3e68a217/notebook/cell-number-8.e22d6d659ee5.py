industrycomp = datasets['Parameters']['industry_competition'][0]


if industrycomp == 'high':
  df2['yhat'] = df2['yhat'] * .92
  df2['yhat_upper'] = df2['yhat_upper'] * .92
  df2['yhat_lower'] = df2['yhat_lower'] * .92
  5
elif industrycomp == 'standard':
  df2['yhat'] = df2['yhat'] 
  df2['yhat_upper'] = df2['yhat_upper'] 
  df2['yhat_lower'] = df2['yhat_lower'] 
elif industrycomp == 'low':
  df2['yhat'] = df2['yhat'] * 1.08
  df2['yhat_upper'] = df2['yhat_upper'] * 1.08
  df2['yhat_lower'] = df2['yhat_lower'] * 1.08
else:
  print("This is quite unexpected behavior!")
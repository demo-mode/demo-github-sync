economicoutlook = datasets['Parameters']['economic_outlook'][0]


if economicoutlook == 'depression':
  df2['yhat'] = df2['yhat'] * .90
  df2['yhat_upper'] = df2['yhat_upper'] * .90
  df2['yhat_lower'] = df2['yhat_lower'] * .90
  
elif economicoutlook == 'poor':
  df2['yhat'] = df2['yhat'] * .95
  df2['yhat_upper'] = df2['yhat_upper'] * .95
  df2['yhat_lower'] = df2['yhat_lower'] * .95
elif economicoutlook == 'standard':
  df2['yhat'] = df2['yhat'] 
  df2['yhat_upper'] = df2['yhat_upper'] 
  df2['yhat_lower'] = df2['yhat_lower'] 
elif economicoutlook == 'good':
  df2['yhat'] = df2['yhat'] * 1.05
  df2['yhat_upper'] = df2['yhat_upper'] * 1.05
  df2['yhat_lower'] = df2['yhat_lower'] * 1.05
elif economicoutlook == 'amazing':
  df2['yhat'] = df2['yhat'] * 1.1
  df2['yhat_upper'] = df2['yhat_upper'] * 1.10
  df2['yhat_lower'] = df2['yhat_lower'] * 1.10
else:
  print("This is quite unexpected behavior!")
mylist = []

for index,row in report_params.iterrows():
  mylist.append(report_url + '?param_acct_mgr='+ row['mgr_list'].replace(' ', '%20') + '&param_order_status=' + row['status_list'])
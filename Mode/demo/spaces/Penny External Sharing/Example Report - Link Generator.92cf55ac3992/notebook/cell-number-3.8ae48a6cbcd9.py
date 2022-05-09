#acct_mgr = pd.DataFrame(acct_mgr.replace(regex=[' '], value='%20'))
acct_mgr['key'] = 1
status_list['key'] = 1
report_params = pd.merge(acct_mgr, status_list, on='key').drop('key',1)

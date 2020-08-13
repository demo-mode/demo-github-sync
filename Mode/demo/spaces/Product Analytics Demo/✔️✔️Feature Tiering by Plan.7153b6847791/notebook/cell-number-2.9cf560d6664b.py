df = datasets[0]

df0 = df[df['org_billing_state'] == 'Enterprise']
df1 = df[df['org_billing_state'] == 'SMB']
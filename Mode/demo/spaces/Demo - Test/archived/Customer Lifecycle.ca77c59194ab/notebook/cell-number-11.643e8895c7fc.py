# Rows where 'total_charges' is NULL
churn['total_charges'][churn['total_charges'].isna()==True]
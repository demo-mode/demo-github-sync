# Replace NULLS with 0
churn['total_charges'] = churn['total_charges'].fillna(0)
churn.isna().any()
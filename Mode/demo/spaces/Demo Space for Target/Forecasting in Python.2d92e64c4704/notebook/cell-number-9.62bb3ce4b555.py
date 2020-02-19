# Apply Box-Cox Transform to value column
df['y'], lam = boxcox(df['value'])

# Print lambda value
print('Lambda: {}'.format(lam))
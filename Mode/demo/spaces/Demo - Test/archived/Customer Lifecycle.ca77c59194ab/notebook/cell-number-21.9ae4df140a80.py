# Visualize correlation between quantitative variables
sn.heatmap(churn2.corr(), annot=True)
plt.show()
## total_charges and tenure have high correlation (0.83)
# total_charges and monthly_charges have medium correlation (0.65)
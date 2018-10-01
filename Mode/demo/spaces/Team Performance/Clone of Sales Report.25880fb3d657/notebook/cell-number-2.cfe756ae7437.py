import seaborn as sns

df = datasets[1]
sales = df.pivot("month","region","rev_per_rep_k")
ax = sns.heatmap(sales, linewidths=.5, annot=True)
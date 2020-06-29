import seaborn as sns

cm = sns.light_palette("green", as_cmap=True)

s = table.style.background_gradient(cmap=cm, low=0)
s
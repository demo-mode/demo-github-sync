import seaborn as sns
import matplotlib.pyplot as plt
from itertools import product
import numpy as np

sns.set(style="darkgrid")

df = datasets[0]

ax = sns.regplot(x="median_load_time", y="churned", data=df,
                 logistic = True, y_jitter=.04, scatter_kws={'c':df['color']})

ax.set_xlabel("User's median load time (seconds)",size = 14,alpha=0.75)
ax.set_ylabel("Churned (0=No, 1=Yes)",size = 14,alpha=0.75)

regline = ax.get_lines()[0]
regline.set_color('darkblue')
regline.set_zorder('5')
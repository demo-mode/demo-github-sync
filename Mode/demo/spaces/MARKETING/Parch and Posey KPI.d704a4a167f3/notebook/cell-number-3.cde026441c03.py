plt.style.use('bmh')

plt.figure(figsize=(14.5, 5.5))  

plt.plot(day, rolling, 'ro', ms=8, alpha=.5, label='Actual',
  markerfacecolor="#666666", markeredgecolor='None', markeredgewidth=5)

plt.plot(future, p(future_idx), color='#56dac4', 
  linewidth=3, label='Predicted')

ax = plt.gca()

ax.yaxis.grid(color='grey', alpha=.5, linestyle='-', linewidth=.5)

ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['bottom'].set_visible(False)
ax.spines['left'].set_visible(False)

plt.tick_params(left='off',right='off',top='off')
plt.title(" ")

plt.legend(loc='upper left',frameon=False)
plt.show()
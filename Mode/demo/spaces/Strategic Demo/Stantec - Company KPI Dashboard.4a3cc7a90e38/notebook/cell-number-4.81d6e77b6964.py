plt.style.use('bmh')

plt.figure(figsize=(12, 6))  

plt.plot(day, rolling, 'ro', ms=8, alpha=.5, label='Actual',
  markerfacecolor="#f96432", markeredgecolor='None', markeredgewidth=5)

plt.plot(future, p(future_idx), color='#765678', 
  linewidth=3, label='Predicted')

ax = plt.gca()

ax.yaxis.grid(color='gray', alpha=.5, linestyle='-', linewidth=.5)

ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['bottom'].set_visible(False)
ax.spines['left'].set_visible(False)

plt.tick_params(left='off',right='off',top='off')
plt.title(" ")

plt.legend(loc='upper left',frameon=False)
plt.show()
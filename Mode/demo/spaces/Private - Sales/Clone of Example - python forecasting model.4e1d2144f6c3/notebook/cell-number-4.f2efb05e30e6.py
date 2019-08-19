plt.figure(figsize=(12, 6)) 

plt.plot(day, rolling, 'ro', ms=8, alpha=.5, label='Actual',
  markerfacecolor="#95A1A1", markeredgecolor='None', markeredgewidth=5)

plt.plot(future, p(future_idx), color='#EE7437', 
  linewidth=2, label='Predicted')

ax = plt.gca()

ax.yaxis.grid(color='grey', alpha=.5, linestyle='-', linewidth=.5)

ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['bottom'].set_visible(False)
ax.spines['left'].set_visible(False)

plt.tick_params(left='off',right='off',top='off')
plt.title("Forecasted daily active users")

plt.legend(loc='upper left',frameon=False)
plt.show()
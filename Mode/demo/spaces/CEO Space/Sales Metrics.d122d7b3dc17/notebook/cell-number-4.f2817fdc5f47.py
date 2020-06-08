plt.figure(figsize=(12,6))
ax = plt.subplot(111, facecolor='#f7f7f9')
plt.plot(day, rolling, 'ro', ms=8, alpha=.5, label='Actual',markerfacecolor="#95A1A1", markeredgecolor='None', markeredgewidth=5, axes=ax)
plt.plot(future, p(future_idx), color='#1ca6fc',linewidth=2, label='Predicted', axes=ax)

# Set Labels
ax.set_xlabel('')
ax.set_ylabel('')

# Adjust the appearance of the grid lines
ax.grid(b=True, axis='y', alpha=0.2, linestyle='dashed')

# Despine
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['bottom'].set_visible(False)
ax.spines['left'].set_visible(False)

# Set the limits for the y-axis
ax.set_ylim(bottom=0, top=350)

# Remove the tick marks
ax.tick_params(axis="both", which="both", bottom="off", top="off", labelbottom="on", left="off", right="off", labelleft="on")

#plt.title("Forecasted Weekly Sales")
#plt.legend(loc='upper right',frameon=False)
#plt.xticks(rotation=45)
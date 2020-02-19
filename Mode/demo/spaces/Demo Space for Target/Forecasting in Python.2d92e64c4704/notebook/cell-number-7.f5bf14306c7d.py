# Create figure and subplot
plt.figure(figsize=(11,8))
ax = plt.subplot(111)

# Plot
df['value'].plot(color='#334f8d', fontsize=11, zorder=2, ax=ax)

# Despine
ax.spines['right'].set_visible(False)
ax.spines['top'].set_visible(False)
ax.spines['left'].set_visible(False)
ax.spines['bottom'].set_visible(False)

# Remove x-axis label
ax.set_xlabel('')

# Switch off ticks
ax.tick_params(axis="both", which="both", bottom="off", top="off", labelbottom="on", left="off", right="off", labelleft="on")

# Annotate
x_line_annotation = dt.datetime(2017, 5, 1) 
x_text_annotation = dt.datetime(2017, 5, 5)
ax.axvline(x=x_line_annotation, linestyle='dashed', alpha=0.5)
ax.text(x=x_text_annotation, y=670000, s='Trend Changepoint', alpha=0.7, color='#334f8d')

# Get y-axis tick values
vals = ax.get_yticks()

# Draw horizontal axis lines
for val in vals:
    ax.axhline(y=val, linestyle='dashed', alpha=0.3, color='#eeeeee', zorder=1)

# Format y-axis label
ax.yaxis.set_major_formatter(StrMethodFormatter('{x:,g}'))

# Set y-axis label
ax.set_ylabel("Orders", labelpad=20, weight='bold')

# Set y-axis limit
ylim = ax.set_ylim(bottom=0)
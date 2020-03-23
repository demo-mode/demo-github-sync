ax = df[['value','y']].plot(color='#334f8d', subplots=True, sharex=True, fontsize=11, legend=False, figsize=(11,12), title=['Untransformed','Box-Cox Transformed'])

for i, x in enumerate(ax):
    # Despine
    x.spines['right'].set_visible(False)
    x.spines['top'].set_visible(False)
    x.spines['left'].set_visible(False)
    x.spines['bottom'].set_visible(False)

    # Remove x-axis label
    x.set_xlabel('')

    # Switch off ticks
    x.tick_params(axis="both", which="both", bottom="off", top="off", labelbottom="on", left="off", right="off", labelleft="on")

    # Format y-axis ticks
    vals = x.get_yticks()
    x.set_yticklabels(['{:,}'.format(int(y)) for y in vals])

    # Draw horizontal axis lines
    for tick in vals:
        x.axhline(y=tick, linestyle='dashed', alpha=0.3, color='#eeeeee', zorder=1)
        
    # Format y-axis label
    x.yaxis.set_major_formatter(StrMethodFormatter('{x:,g}'))

    # Set y-axis limit
    if i == 0:
      x.set_ylim(bottom=0)
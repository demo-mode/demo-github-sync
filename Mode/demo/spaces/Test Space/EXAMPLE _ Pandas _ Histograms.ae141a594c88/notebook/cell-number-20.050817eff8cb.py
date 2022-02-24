ax = df.hist(column='session_duration_seconds', bins=25, grid=False, figsize=(10,8), color='#86bf91', zorder=2, rwidth=0.9)

ax = ax[0]
for x in ax:
    
    # Despine
    x.spines['right'].set_visible(False)
    x.spines['top'].set_visible(False)
    x.spines['left'].set_visible(False)
    
    # Switch off ticks
    x.tick_params(axis="both", which="both", bottom="off", top="off", labelbottom="on", left="off", right="off", labelleft="on")
    
    # Draw horizontal axis lines
    vals = x.get_yticks()
    for tick in vals:
        x.axhline(y=tick, linestyle='dashed', alpha=0.4, color='#eeeeee', zorder=1)
        
    # Remove title
    x.set_title("")
    
    # Set x-axis label
    x.set_xlabel("Session Duration (Seconds)", labelpad=20, weight='bold', size=12)
    
    # Set y-axis label
    x.set_ylabel("Sessions", labelpad=20, weight='bold', size=12)
    
    # Format y-axis label
    x.yaxis.set_major_formatter(StrMethodFormatter('{x:,g}'))
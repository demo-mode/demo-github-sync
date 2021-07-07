fig = ff.create_distplot(hist_data, group_labels, bin_size=.2)

fig.layout.update(
  font = dict(color= "#ffffff"), 
  paper_bgcolor= "#191924",
  plot_bgcolor="#191924"
  )
  
iplot(fig)

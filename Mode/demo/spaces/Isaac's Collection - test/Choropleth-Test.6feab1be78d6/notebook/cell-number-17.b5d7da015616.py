fig = ff.create_choropleth(
      fips=fips, values=values, scope=scope,
      colorscale=colorscale,round_legend_values=True,
      simplify_county=0, simplify_state=0,
      county_outline={'color': 'rgb(15,15,55)', 'width': 0.5},
      state_outline={'width': 0.5},
      legend_title='Population Per County',
      title='Maryland')
      
fig.show()      
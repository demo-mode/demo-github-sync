data = dict(type = 'choropleth',
            colorscale = 'Blues',
            z = source_data['total_state_population'],
            locations = source_data['state'],
            locationmode = 'USA-states',
           # text = df['state'], (this is commented out in the code because it doesn’t match)
            marker = dict(line = dict(color = 'rgb(255,255,255)', width = 1)),
            colorbar = {'title' : '2012 US Population'}
            )
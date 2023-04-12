import json
import pandas as pd
import folium

# Load the GeoJSON data for the US states
with open('us-states.json', 'r') as f:
    data = json.load(f)

# Load the data into a Pandas DataFrame
df = pd.read_csv('SELECT* FROM {{ @Paper_Sales }}')

# Create the map object
m = folium.Map(location=[37.0902, -95.7129], zoom_start=4)

# Create the choropleth map
folium.Choropleth(
    geo_data=data,
    name='choropleth',
    data=df,
    columns=['state', 'total_sales_usd'],
    key_on='feature.id',
    fill_color='PuRd',
    fill_opacity=0.7,
    line_opacity=0.2,
    legend_name='Total Sales (USD)'
).add_to(m)

# Highlight California, Texas, and Florida
folium.GeoJson(
    data,
    name='highlighted',
    style_function=lambda feature: {
        'fillColor': 'purple' if feature['id'] in ['CA', 'TX', 'FL'] else 'none',
        'color': 'purple' if feature['id'] in ['CA', 'TX', 'FL'] else 'none',
        'weight': 3,
        'fillOpacity': 0.5,
        'opacity': 1,
    },
    tooltip=folium.features.GeoJsonTooltip(fields=['name'], aliases=['State'])
).add_to(m)

# Add a layer control to the map
folium.LayerControl().add_to(m)

# Save the map as an HTML file
m.save('your_map.html')

! pip install folium -t "/tmp" > /dev/null 2>&1
import pandas as pd
import folium
from folium.plugins import HeatMap
ds = datasets[1]
ds = ds.fillna(0)
#Assign Map Attributes
m = folium.Map(location=[37.700, -122.39],
  title="Geographic Sales",
    height=500,
    center_lat=37.700,
    center_lng=-122.39,
    dot_size=.001,
    dot_opacity=.9,)
    # Conver lat and lon to numpy array (old method: .as_matrix())
points_array = ds[['lat', 'lng']].values
HeatMap(points_array, min_opacity=0.3, radius=20).add_to(m)
m
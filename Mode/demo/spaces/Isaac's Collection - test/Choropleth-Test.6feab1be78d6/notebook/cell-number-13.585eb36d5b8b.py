#code here
folium.Choropleth(
    geo_data=state_geo,
    name="choropleth",
    data=source_data,
    columns=["state", "total_state_population"],
    key_on="feature.id",
    fill_color="YlGn",
    fill_opacity=0.7,
    line_opacity=0.2,
    legend_name="Choropleth by Folium",
).add_to(m_usa)

folium.LayerControl().add_to(m_usa)

m_usa
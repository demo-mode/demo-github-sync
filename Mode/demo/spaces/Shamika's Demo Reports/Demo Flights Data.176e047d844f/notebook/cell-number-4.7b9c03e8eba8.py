import plotly.express as px
df = px.data.iris()
fig = px.scatter_matrix(df)
fig.show()
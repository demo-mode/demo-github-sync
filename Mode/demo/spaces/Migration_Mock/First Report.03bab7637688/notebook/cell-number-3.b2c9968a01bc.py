from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()
import pandas as pd



trace1 = Bar(
    x=df.quarter,
    y=df.touchdowns,
    name='Touchdowns'
)

data = [trace1]
layout = Layout(
    title='Touchdowns by Quarter for ' + df.team[0],
    width= 600,
    height= 400,   
    yaxis=dict(
        title='Touchdowns'
    ),
)

fig = dict(data=data, layout=layout)
iplot(fig)
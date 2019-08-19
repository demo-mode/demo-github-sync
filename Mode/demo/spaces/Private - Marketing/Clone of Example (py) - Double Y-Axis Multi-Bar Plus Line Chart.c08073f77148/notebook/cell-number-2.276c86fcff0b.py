from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()
import pandas as pd

df = datasets[0]

trace1 = Bar(
    x=df.destination_airport,
    y=df.first_class_rev,
    name='First Class Revenue',
    marker=dict(
        color='#58C9B9'
    )
)

trace2 = Bar(
    x=df.destination_airport,
    y=df.coach_rev,
    name='Coach Revenue'
)

trace3 = Scatter(
    x=df.destination_airport,
    y=df.flights,
    name='Flights',
    yaxis='y2',
    line = dict(
            color = '#A072C7',
            width = 2)
)

data = [trace1, trace2, trace3]
layout = Layout(
    title='Flights and Revenue',
    width= 1150,
    height= 475,
    legend=dict(
        x=0.1,
        y=1.25
    ),
    yaxis=dict(
        title='Revenue',
        range=[0,30500]
    ),
    yaxis2=dict(
        title='Flights',
        range=[0,305],
        titlefont=dict(
            color='Green'
        ),
        tickfont=dict(
            color='Green'
        ),
        overlaying='y',
        side='right'
    )
)

fig = dict(data=data, layout=layout)
iplot(fig)
from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()
import pandas as pd

df = datasets[0]

trace1 = Scatter(
    x = df.date,
    y = df.control,
    name = 'Control',
    line = dict(
        color = '#43a5da',
        width = 4)
)

trace2 = Scatter(
    x = df.date,
    y = df.test,
    name = 'Test',
    line = dict(
        color = '#06d0ad',
        width = 4)
)

data = [trace1, trace2]

layout = dict(
    width=1100,
    height=445,
    showlegend=True,
    legend=dict(
        x=.8,
        y=1.2),
    paper_bgcolor='#ffffff',
    plot_bgcolor='#ffffff',
    hovermode='compare',
    margin=dict(b=10,l=80,r=30,t=2),
    title='Conversion rate over time',
    titlefont=dict(
               family='Graphik',
               size=16,
               color='#394242'
               ),
xaxis=dict(
        rangeselector=dict(
            buttons=list([
                dict(count=14,
                    label='2w',
                    step='day',
                    stepmode='backward'),             
                dict(count=1,
                    label='1m',
                    step='month',
                    stepmode='backward'),
                dict(count=2,
                    label='2m',
                    step='month',
                    stepmode='backward'),
                dict(step='all')
            ])
        ),
        rangeslider=dict(),
        type='date'
    ),
        yaxis=dict(
                   range=[-2,26],
                   gridcolor='#a4a5a9',
                   title='Conversion rate',
                         titlefont=dict(
                         family='Graphik',
                         size=14,
                         color='#666666'
                         ),
                   ticksuffix='%'
        )
    )

fig = dict(data=data, layout=layout)
iplot(fig)
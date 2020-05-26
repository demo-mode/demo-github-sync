from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()

df = datasets[0]

df0 = df[df['quarter'] == 1]
df1 = df[df['quarter'] == 2]
df2 = df[df['quarter'] == 3]
df3 = df[df['quarter'] == 4]

trace0 = Bar(
    y=df0.team,
    x=df0.perc,
    name='1st',
    orientation = 'h',
    marker = dict(
        color = 'rgba(135,188,222,0.6)',
        line = dict(
            color = 'rgb(135,188,222)',
            width = 3)
    )
)
trace1 = Bar(
    y=df1.team,
    x=df1.perc,
    name='2nd',
    orientation = 'h',
    marker = dict(
        color = 'rgba(128,94,115,0.6)',
        line = dict(
            color = 'rgb(128,94,115)',
            width = 3)
    )
)
trace2 = Bar(
    y=df2.team,
    x=df2.perc,
    name='3rd',
    orientation = 'h',
    marker = dict(
        color = 'rgba(152,130,172,0.6)',
        line = dict(
            color = 'rgb(78,77,92)',
            width = 3)
    )
)
trace3= Bar(
    y=df3.team,
    x=df3.perc,
    name='4th',
    orientation = 'h',
    marker = dict(
        color = 'rgba(45,70,84,0.6)',
        line = dict(
            color = 'rgb(45,70,84)',
            width = 3)
    )
)

data = [trace3, trace2, trace1, trace0]
layout = Layout(
    margin=dict(b=40,l=60,r=30,t=30),
    barmode='stack',
    xaxis=dict(
        ticksuffix="%",
    ),
    yaxis=dict(
        ticklen=10,
    ),
)
        
fig = dict(data=data, layout=layout)
iplot(fig)
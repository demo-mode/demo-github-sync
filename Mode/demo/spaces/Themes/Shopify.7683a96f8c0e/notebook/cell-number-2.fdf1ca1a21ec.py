from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()
import pandas as pd
import numpy as np

df = datasets["14. Customer Service efficiency"]
df.head()
hover_text = []
for index, row in df.iterrows():
    hover_text.append('Date: {day}'
                      'Handle time: {ht} mins'
                      'Interactions: {i}'
                      'CSAT score: {c}'.format(day=row['day'],
                                            ht=row['avg_handle_time'],
                                            i=row['avg_interactions'],
                                            c=row['avg_quality']))

df['text'] = hover_text

trace = Scatter3d(
    x=df.avg_handle_time, 
    y=df.avg_interactions, 
    z=df.avg_quality,
    name='Result',
    text=df['text'],
    hoverinfo = "text",
    marker=dict(
        size=4,
        color='#212121',
        ),
    line=dict(
        color='#212121',
        width=4
    )
  )

start = Scatter3d(
    x=df[:1].avg_handle_time,
    y=df[:1].avg_interactions, 
    z=df[:1].avg_quality,
    text=df['text'],
    hoverinfo = "text",
    mode='markers',
    name='Start',
    marker=dict(
        color='#219859',
        size=6,
        symbol='circle',
        line=dict(
            color='#219859',
            width=1
        )
    )
)

stop = Scatter3d(
    x=df[13:].avg_handle_time,
    y=df[13:].avg_interactions, 
    z=df[13:].avg_quality,
    text=df[13:]['text'],
    hoverinfo = "text",
    name='End',
    mode='markers',
    marker=dict(
        color='#e50000',
        size=6,
        symbol='circle',
        line=dict(
            color='#e50000',
            width=1
        )
    )
)

data = [trace, start, stop]

layout = dict(
    width=588,
    height=623,
    autosize=False,
    title='Customer Service Cube: Time Series',
    titlefont=dict(
               family='Helvetica',
               size=22,
               color='#646C6C'
               ),
    scene=dict(
        xaxis=dict(
            title=('Handle time (mins)'),
            titlefont=dict(
            family='Helvetica',
            size=12,
            color='#894FBA'
        ),
            range=[0,30],
            gridcolor='rgb(255, 255, 255)',
            zerolinecolor='rgb(255, 255, 255)',
            showbackground=True,
            backgroundcolor='rgb(230, 230,230)'
        ),
        yaxis=dict(
            title='Interactions',
               titlefont=dict(
               family='Helvetica',
               size=12,
               color='#37B067'
               ),
            range=[0,5],
            gridcolor='rgb(255, 255, 255)',
            zerolinecolor='rgb(255, 255, 255)',
            showbackground=True,
            backgroundcolor='rgb(230, 230,230)'
        ),
        zaxis=dict(
            title='CSAT score',
            titlefont=dict(
            family='Helvetica',
            size=12,
            color='#27B8D9'
        ),
            range=[0,10],
            gridcolor='rgb(255, 255, 255)',
            zerolinecolor='rgb(255, 255, 255)',
            showbackground=True,
            backgroundcolor='rgb(230, 230,230)'
        ),
        camera=dict(
            up=dict(
                x=0,
                y=0,
                z=1
            ),
            eye=dict(
                x=-1.7428,
                y=1.0707,
                z=0.7100,
            )
        ),
        aspectratio = dict( x=.7, y=.7, z=0.5 ),
        aspectmode = 'manual'
    ),
  
  )

fig = dict(data=data, layout=layout)
iplot(fig)
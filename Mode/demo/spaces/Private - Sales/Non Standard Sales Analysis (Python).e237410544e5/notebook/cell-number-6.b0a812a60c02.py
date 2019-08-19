from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()
import pandas as pd
import numpy as np

df = datasets['Query 5']
df.head()

hover_text = []
for index, row in df.iterrows():
    hover_text.append('Date: {day}<br>'
                      'Handle time: {ht} mins<br>'
                      'Interactions: {i}<br>'
                      'CSAT score: {c}<br>'.format(day=row['day'],
                                            ht=row['avg_handle_time'],
                                            i=row['avg_interactions'],
                                            c=row['avg_quality']))

df['text'] = hover_text

df0 = df[df['representative'] == 'Elaine']
df1 = df[df['representative'] == 'George']
df2 = df[df['representative'] == 'Jerry']
df3 = df[df['representative'] == 'Kramer']

trace0 = Scatter3d(
    x=df0.avg_handle_time, y=df0.avg_interactions, z=df0.avg_quality,
    name='Elaine',
    hoverinfo="text",
    text=df['text'],
    mode='markers',
    marker=dict(
        size=5.5,
        color='#4EA5D9',
        )
  )

trace1 = Scatter3d(
    x=df1.avg_handle_time, y=df1.avg_interactions, z=df1.avg_quality,
    name='George',
    hoverinfo="text",
    text=df['text'],
    mode='markers',
    marker=dict(
        size=5.5,
        color='#224870',
        )
  )

trace2 = Scatter3d(
    x=df2.avg_handle_time, y=df2.avg_interactions, z=df2.avg_quality,
    name='Jerry',
    hoverinfo="text",
    text=df['text'],
    mode='markers',
    marker=dict(
        size=5.5,
        color='#44CFCB',
        )
  )
  
trace3 = Scatter3d(
    x=df3.avg_handle_time, y=df3.avg_interactions, z=df3.avg_quality,
    name='Kramer',
    hoverinfo="text",
    text=df['text'],
    mode='markers',
    marker=dict(
        size=5.5,
        color='#FB5607',
        )
  )

data = [trace0,trace1,trace2,trace3]

layout = dict(
    width=588,
    height=623,
    autosize=False,
    title='Customer Service Cube: By Representative',
    titlefont=dict(
               family='Helvetica',
               size=22,
               color='#646C6C'
               ),
    scene=dict(
        xaxis=dict(
            title='Handle time (mins)',
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
            range=[0.5,2.5],
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
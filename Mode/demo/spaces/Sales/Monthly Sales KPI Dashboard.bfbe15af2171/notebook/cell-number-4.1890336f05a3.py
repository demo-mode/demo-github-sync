from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()
import pandas as pd



trace1 = Scatter(
    x = df.day,
    y = df.avg_handle_time,
    mode = 'lines',
    name='Average Handle_time'
    
)

trace2 = Scatter(
    x = df.day,
    y = df.avg_interactions,	
     mode = 'lines',
    name='Average Interaction'
)


trace3 = Scatter(
    x = df.day,
    y = df.avg_quality,	
    mode = 'lines',
    name='Average quality'
)


data = [trace1,trace2, trace3]

layout = dict(
    #width=800,
    height=500,
    title='Customer Service Efficiency Over Time',
    titlefont=dict(
               family='Helvetica',
               size=16,
               color='#394242'
               ),
        xaxis=dict(
                   title='Date'
        ), 
        paper_bgcolor = 'rgb(244,244,248)',
        plot_bgcolor= 'rgb(244,244,248)',
         margin=dict(l=50,r=0,b=60,t=50,pad=0,autoexpand=False),
        yaxis=dict(
                   ##range=[0,200],
                   ##gridcolor='#a4a5a9',
                   title=''
        )
    )

fig = dict(data=data, layout=layout)
iplot(fig)
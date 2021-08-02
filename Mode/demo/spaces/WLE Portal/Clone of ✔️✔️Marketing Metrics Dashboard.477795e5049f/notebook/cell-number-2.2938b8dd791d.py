import pandas as pd
from plotly.graph_objs import *
from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
import plotly
plotly.offline.init_notebook_mode()

df17=datasets["Raw_Data"]
df17=df17.reset_index()

df18=datasets["Raw_Data_Comscore"]
df18=df18.reset_index()

df_final1=df17[['month','visits','video_starts','visits_goal','video_goals']].copy()
df_final2=df18[['month','comscore_u_vs','millenial_reach_perc','millenial_composition_perc']].copy()

trace_sessions = Scatter(
    x=df_final1.month,
    y=df_final1['visits'],
    name = "Sessions",
    line = dict(color = '#17BECF'),
    opacity = 0.8,
    visible=True)

trace_videos = Scatter(
    x=df_final1.month,
    y=df_final1['video_starts'],
    name = "Video Starts",
    line = dict(color = '#17BECF'),
    opacity = 0.8,
    visible=False)

trace_comscore = Scatter(
    x=df_final2.month,
    y=df_final2['comscore_u_vs'],
    name = "Comscore UVs",
    line = dict(color = '#17BECF'),
    opacity = 0.8,
    visible=False)

trace_sessions_goal = Scatter(
    x=df_final1.month,
    y=df_final1['visits_goal'],
    name = "Sessions Goal",
    line = dict(color = '#17BECF',dash = 'dash'),
    opacity = 0.8,
    visible=True)

trace_videos_goal = Scatter(
    x=df_final1.month,
    y=df_final1['video_goals'],
    name = "Video Goal",
    line = dict(color = '#17BECF',dash = 'dash'),
    opacity = 0.8,
    visible=False)
    
trace_comscore_mil_reach = Scatter(
    x=df_final2.month,
    y=df_final2['millenial_reach_perc'],
    name = "Comscore Millenial Reach %",
    line = dict(color = '#17BECF'),
    opacity = 0.8,
    visible=False)

trace_comscore_mil_comp = Scatter(
    x=df_final2.month,
    y=df_final2['millenial_composition_perc'],
    name = "Comscore Millenial Composition %",
    line = dict(color = '#17BECF'),
    opacity = 0.8,
    visible=False)

data = [trace_sessions,trace_videos,trace_comscore,trace_sessions_goal,trace_videos_goal,trace_comscore_mil_reach,trace_comscore_mil_comp]

updatemenus = list([
    dict(
        direction = 'down',
        pad = {'r': 10, 't': 8},
        showactive = True,
        x = 0.25,
        xanchor = 'left',
        y = 1.15,
        yanchor = 'top', 
        buttons=list([   
            dict(label = 'Sessions',
                 method = 'update',
                 args = [{'visible': [True, False, False, True, False, False, False]},
                         {'title': 'Session Trend',
                          'annotations':  ["Session goals are available from 2018 onwards only for Digital brands"]}]),
            dict(label = 'Videos',
                 method = 'update',
                 args = [{'visible': [False, True, False, False, True, False, False]},
                         {'title': 'Video Trend',
                          'annotations':  ["Video goals are available from 2017 onwards only for Digital brands"]}]),
            dict(label = 'ComScore UVs',
                 method = 'update',
                 args = [{'visible': [False, False, True, False, False, False, False]},
                         {'title': 'ComScore UVs Trend',
                          'annotations':  []}]),
            dict(label = 'ComScore Millenial Reach %',
                 method = 'update',
                 args = [{'visible': [False, False, False, False, False, True, False]},
                         {'title': 'ComScore Millenial Reach % Trend',
                          'annotations':  []}]),
            dict(label = 'ComScore Millenial Composition %',
                 method = 'update',
                 args = [{'visible': [False, False, False, False, False, False, True]},
                         {'title': 'ComScore Millenial Composition % Trend',
                          'annotations':  []}])
        ]),
    )
])

layout = dict(
    #title='Time Series with Rangeslider',
    width= 1100,
    height= 480,
    xaxis=dict(
        rangeselector=dict(
            buttons=list([
                dict(count=8,
                     label='6mo',
                     step='month',
                     stepmode='backward'),     
                dict(count=11  ,
                     label='FY 2017-18',
                     step='month',
                     stepmode='backward'),
                  dict(label='All',
                  step='all')
            ])
        ),
        rangeslider=dict(),
        type='month'
    ),
    updatemenus=updatemenus
)

fig = dict(data=data, layout=layout)
iplot(fig)
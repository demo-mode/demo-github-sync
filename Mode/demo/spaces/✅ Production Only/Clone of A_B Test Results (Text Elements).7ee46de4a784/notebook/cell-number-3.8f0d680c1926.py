x0 = df.test
x1 = df.control

trace0 = Box(
    x=x0,
    name = 'Test',
    line = dict(
        color = '#06d0ad'),
    hoverinfo='none'
    
)
trace1 = Box(
    x=x1,
    name = 'Control',
    line = dict(
        color = '#43a5da'),
    hoverinfo='none'
)
data = [trace0, trace1]

layout = dict(
    width=328,
    height=90,
    showlegend=False,
    legend=dict(
        x=.8,
        y=1.2),
    paper_bgcolor='#ffffff',
    plot_bgcolor='#ffffff',
    hovermode='compare',
    margin=dict(b=15,l=0,r=0,t=16),
    title=' ',
    titlefont=dict(
               family='Graphik',
               size=16,
               color='#394242'
               ),
        xaxis=dict(
                   range=[-2,26],
                   gridcolor='#a4a5a9',
                   title=' ',
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
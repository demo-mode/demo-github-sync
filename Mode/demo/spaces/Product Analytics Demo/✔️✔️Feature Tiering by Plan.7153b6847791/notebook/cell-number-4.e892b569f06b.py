trace1 = Box(
         y=df0.screen_share_creator_rate*100,
         name='<b>Enterprise</b>',
         hoverinfo = 'y',
         marker = dict(
         color = '#06D0AD')
         )
         
trace2 = Box(
         y=df1.screen_share_creator_rate*100,
         name='<b>SMB</b>',
         hoverinfo = 'y',
         marker = dict(
         color = '#BB60F8')
         )

data = [trace2,trace1]

layout = dict(
    width=570,
    height=480,
    showlegend=False,
    legend=dict(
        x=.8,
        y=1.2),
    paper_bgcolor='#f4f4f8',
    plot_bgcolor='#f4f4f8',
    hovermode='closest',
    margin=dict(b=35,l=50,r=20,t=30),
   #annotations=[ dict(
   #              text="More health code violations →",
   #                showarrow=False,
   #                xref="paper", yref="paper",
   #                opacity=.8, 
   #                x=.96, y=1.04,
   #                font=dict(
   #                family='Arial',
   #                size=16,
   #                color='#1a1a1a'
   #               )),
   #              dict(
   #              text="← Cleaner",
   #                showarrow=False,
   #                xref="paper", yref="paper",
   #                opacity=.8, 
   #                x=0.08, y=1.04,
   #                font=dict(
   #                family='Arial',
   #                size=16,
   #                color='#1a1a1a'
   #               ))
   #               
   #               ],
    title='Screen Share Creator Rate',
    titlefont=dict(
               family='Arial',
               size=16,
               color='#394242'
               ),
        yaxis=dict(title= '' ,
                         titlefont=dict(
                         family='Arial',
                         size=14,
                         color='#666666'
                         ),
                         gridcolor='rgba(170,170,170,.3)',
                         gridwidth=2,
                         ticksuffix='%',
                         tickfont=dict(
                         family='Arial',
                         size=12,
                         color='666666',
                         ),
          range=[0,36],
               ),
        xaxis=dict(gridcolor='#a4a5a9',
                   showgrid=False,
                   position=0,
                   tickfont=dict(
                   family='Arial',
                   size=12,
                   color='666666'
                   ),
                   title=' ',
                         titlefont=dict(
                         family='Arial',
                         size=8,
                         color='#666666'
                         )
        )
    )

fig = dict(data=data, layout=layout)
iplot(fig)
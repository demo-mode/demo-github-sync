from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()


trace1 = Scatter(
    x = Actual1.ds,
    y = Actual1.yhat,
    name='Actual'
    
)

trace2 = Scatter(
    x = Forecast1.ds,
    y = Forecast1.yhat,
    name='Predicted'
)

data = [trace1,trace2]

layout = Layout(
    width=1100,
    height=500,
    title='Sales Forecast',
    titlefont=dict(
               family='Helvetica',
               size=16,
               color='#394242'
               ),
        xaxis=dict(
        rangeselector=dict(
            buttons=list([
                dict(count=1,
                    label='1m',
                    step='month',
                    stepmode='backward'),
                dict(count=6,
                    label='6m',
                    step='month',
                    stepmode='backward'),
                dict(count=1,
                    label='YTD',
                    step='year',
                    stepmode='todate'),
                dict(count=1,
                    label='1y',
                    step='year',
                    stepmode='backward'),
                dict(step='all')
            ])
        ),
        rangeslider=dict(),
        type='date'
    ),
        yaxis=dict(
                   range=[0,700000],
                   gridcolor='#a4a5a9',
                   title='Sales'
        )
) 
  
fig = dict(data=data, layout=layout)
iplot(fig)
df = datasets[0]

#Import Plotly
from plotly.offline import download_plotlyjs, init_notebook_mode, iplot
from plotly.graph_objs import *
import plotly
plotly.offline.init_notebook_mode()
import plotly.figure_factory as ff
import pandas as pd
import plotly.graph_objs as go
from datetime import datetime
import numpy as np


#Add Histogram data
x1 = np.random.randn(200) + 2
x2 = np.random.randn(200) + 4

#Group data together
hist_data = [x1, x2]
group_labels = ['Control', 'Variant #1']

#Create displot with customer bin_size
fig = ff.create_distplot(hist_data, group_labels, bin_size=.2)

fig.layout.update(
    title = "Distribution of Outcomes by Test Group", 
      font = dict(family="Courier New, monospace", size=14, color="#7f7f7f"),
    autosize=False,
    width=900,
    height=500,
  )
iplot(fig)

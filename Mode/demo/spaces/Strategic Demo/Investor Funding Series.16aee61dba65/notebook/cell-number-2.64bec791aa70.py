import pandas as pd
import numpy as np
data = datasets[0] # assign SQL query results to the data variable
data = data.fillna(np.nan)
data.head()
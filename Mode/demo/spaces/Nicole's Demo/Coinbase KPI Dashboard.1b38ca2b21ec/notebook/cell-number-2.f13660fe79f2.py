import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

daily = datasets['Orders']

day = pd.to_datetime(daily['day'])
orders = daily['orders']

plt.plot(day, orders)
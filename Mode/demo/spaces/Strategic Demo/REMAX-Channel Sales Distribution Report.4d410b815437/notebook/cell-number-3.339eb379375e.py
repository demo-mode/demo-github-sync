import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

daily = datasets[1]

date = pd.to_datetime(daily['date'])
gloss_units = daily['gloss_units']

plt.plot(date, gloss_units)
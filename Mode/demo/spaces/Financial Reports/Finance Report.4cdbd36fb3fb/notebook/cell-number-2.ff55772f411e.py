import matplotlib.pyplot as plt
import numpy as np

daily = datasets[0]

day = pd.to_datetime(daily['day'])
events = daily['metric']

plt.plot(day, events)
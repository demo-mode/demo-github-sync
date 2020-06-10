import matplotlib.pyplot as plt
import numpy as np

daily = datasets[5]

day = pd.to_datetime(daily['day'])
orders = daily['orders']

plt.plot(day, orders)
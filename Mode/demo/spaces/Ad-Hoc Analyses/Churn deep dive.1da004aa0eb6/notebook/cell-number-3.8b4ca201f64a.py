import matplotlib
import matplotlib.pyplot as plt
#plt.style.use('fivethirtyeight')

df2 = datasets[1]

ax = df2.plot(x="month")

ax.set_xlabel("Month",size = 20,alpha=0.5)
ax.set_ylabel("Active Users",size = 20,alpha=0.5)
ax.figure.set_size_inches(7,4.25)

ax.get_yaxis().set_major_formatter(
    matplotlib.ticker.FuncFormatter(lambda x, p: format(int(x), ',')));
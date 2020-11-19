if len(df_c.index) == 0:
  
  # build a rectangle in axes coords
  left, width = 1, 1
  bottom, height = 1, 1
  right = left + width
  top = bottom + height
  
  fig = plt.figure()
  ax = fig.add_axes([0,0,0,0])
  
  # axes coordinates are 0,0 is bottom left and 1,1 is upper right
  p = patches.Rectangle(
      (left, bottom), width, height,
      fill=False, transform=ax.transAxes, clip_on=False
      )
  
  ax.add_patch(p)
          
  ax.text(.5, .5, 'No conversions',
          horizontalalignment='center',
          verticalalignment='bottom',
          fontsize=40, color=color,
          fontname='Questrial',
          backgroundcolor='#ffffff')
  
  ax.set_axis_off()
  plt.gcf().set_facecolor('#ffffff')
  plt.show()

else:
  
  import matplotlib.pyplot as plt
  plt.figure(figsize=(18.5,1.7))
  import seaborn as sns

  sns.set_style("whitegrid")
  ax = sns.boxplot(x="ci", y="variation", data=df_c, palette=colors)
  
  plt.setp(ax.lines, color="#333333")
  
  ax.set_ylabel('')    
  ax.set_xlabel('Rate')
  
  plt.gcf().set_facecolor('#ffffff')
  ax.set_axis_bgcolor('#ffffff')
  
  ax.spines['bottom'].set_color('#333333')
  ax.spines['top'].set_color('#333333') 
  ax.spines['right'].set_color('#333333')
  ax.spines['left'].set_color('#333333')
  
  ax.tick_params(axis='x', colors='#333333')
  ax.tick_params(axis='y', colors='#333333')
  
  ax.yaxis.label.set_color('#333333')
  ax.xaxis.label.set_color('#333333')
  
  ax.title.set_color(color);
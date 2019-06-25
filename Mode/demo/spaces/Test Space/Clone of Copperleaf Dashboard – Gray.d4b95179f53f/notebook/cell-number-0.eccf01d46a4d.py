import numpy
import matplotlib as plt
from scipy.cluster.vq import *
import pylab
pylab.close()

plt.style.use('seaborn-white')

df = datasets["11. Average Order Size by Account"]

standard_bound = df['standard'].quantile(.9)
special_bound = df['special'].quantile(.9)

df = df[df['standard'] < standard_bound]
df = df[df['special'] < special_bound]

cols = df[['standard','special']]
xy = numpy.array(cols)

res, idx = kmeans2(numpy.array(zip(xy[:,0],xy[:,1])),3)
 
colors = ([([0.4,1,0.4],[1,0.4,0.4],[0.1,0.8,1])[i] for i in idx])
 
# plot colored points
pylab.scatter(xy[:,0],xy[:,1], c=colors)
 
# mark centroids as (X)
pylab.scatter(res[:,0],res[:,1], marker='o', s = 500, linewidths=2, c='none')
pylab.scatter(res[:,0],res[:,1], marker='x', s = 500, linewidths=2)
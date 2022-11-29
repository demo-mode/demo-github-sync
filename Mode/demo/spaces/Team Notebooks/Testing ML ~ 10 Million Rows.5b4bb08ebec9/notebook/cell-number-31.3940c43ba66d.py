p3 = ggplot (data = tmp, aes( x= '', y=percentage )) + 
  ggtitle('Products Top 30') + ylab('percentage.of.orders') + geom_boxplot() + xlab('Products')

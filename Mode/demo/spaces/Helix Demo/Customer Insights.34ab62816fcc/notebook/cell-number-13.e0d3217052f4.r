
tmp = order_products_train %>%
  left_join(products) %>%
  group_by(product_name) %>%
  summarize(count=n()) %>%
  top_n(n=30, wt=count) %>%  mutate(percentage=count/sum(count))
p1 = ggplot (tmp, aes(x=reorder(product_name,count), y=percentage)) +  
  geom_col() + ggtitle('Products Top 30') + ylab('Percentage of Orders') +
  theme (
    axis.text.x=element_text(angle=90, hjust=1, vjust=0.5),
    axis.title.x = element_blank()) 
p2 = ggplot (data = tmp, aes( x= '', y=percentage )) + 
  ggtitle('Products Top 30') + ylab('percentage.of.orders') + geom_boxplot() + xlab('Products')
grid.arrange(p1, p2, ncol = 2)
# Plot p2 and P3
p2 = ggplot (tmp, aes(x=reorder(product_name,count), y=percentage)) +  
  geom_col() + ggtitle('Products Top 30') + ylab('Percentage of Orders') +
  theme (
    axis.text.x=element_text(angle=90, hjust=1, vjust=0.5),
    axis.title.x = element_blank()) 

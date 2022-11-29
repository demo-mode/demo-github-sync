order_products_prior %>% 
  left_join(orders) %>% left_join(products) %>%
  group_by(order_dow, product_name) %>%
  summarize(n=n()) %>%
  mutate(percentage=n/sum(n)) %>%
  top_n(10, wt=n) %>%
  ggplot (aes(x=as.factor(order_dow), y=percentage, fill=product_name)) + 
    geom_col() + ylab('Proprtion of Orders') + ggtitle('Daily Top 10 Products Ordered') +
    theme(legend.position="bottom",legend.direction="horizontal")
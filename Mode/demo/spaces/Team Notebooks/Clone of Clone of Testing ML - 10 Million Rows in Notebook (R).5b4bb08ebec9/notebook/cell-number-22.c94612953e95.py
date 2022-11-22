order_products_prior %>%
  left_join(orders) %>%
  group_by(order_hour_of_day) %>%
  summarize(count = n()) %>%
  mutate(percentage=count/sum(count)) %>%
  ggplot (aes(x=as.factor(order_hour_of_day), y=percentage)) + 
    geom_col()+ ylab('Percentage of Orders') + ggtitle('Hourly Orders')
tmp = order_products_train %>%
  left_join(products) %>%
  group_by(product_name) %>%
  summarize(count=n()) %>%
  top_n(n=30, wt=count) %>%  mutate(percentage=count/sum(count))
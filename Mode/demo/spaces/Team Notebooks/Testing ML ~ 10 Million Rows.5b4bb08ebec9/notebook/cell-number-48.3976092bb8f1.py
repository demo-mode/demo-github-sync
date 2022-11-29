train.label = orders %>% 
  filter(eval_set=='train') %>% 
  left_join(order_products_train) %>%
  left_join(products) %>%
  mutate(actual=1) %>%   #this is training label
  select(user_id, order_id, product_id, product_name, actual)
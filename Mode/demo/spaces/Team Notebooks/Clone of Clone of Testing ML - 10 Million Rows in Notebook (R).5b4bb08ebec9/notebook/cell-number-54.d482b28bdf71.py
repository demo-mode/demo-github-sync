train.label %>% filter(user_id==1)
m1.predict = orders %>% 
  filter(eval_set=='prior') %>% 
  group_by(user_id) %>%
  top_n(n=1, wt=order_number) %>%       #last order has the higher order_number
  left_join(order_products_prior) %>%
  mutate (
    predicted=1) %>%              #predict based on last ordered, therefore 1
  select(user_id, product_id, predicted) %>% 
  full_join(train.label) %>%  # join with train.label for items not predicted but in train.label
  select(user_id, product_id, actual, predicted) %>%
  replace(., is.na(.), 0) %>% # treat not predicted as 0
  arrange(user_id, product_id)
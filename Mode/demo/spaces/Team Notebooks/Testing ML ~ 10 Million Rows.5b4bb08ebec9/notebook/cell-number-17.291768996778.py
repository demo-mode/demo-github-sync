Orders_everyhour <- orders %>% group_by(order_hour_of_day) %>%
summarise(Number_of_Orders=n()) %>% mutate(Percentage_of_orders=(Number_of_Orders*100/nrow(orders)))
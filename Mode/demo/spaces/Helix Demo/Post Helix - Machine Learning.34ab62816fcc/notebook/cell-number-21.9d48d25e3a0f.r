grouped_df <- order_products_train %>%
                group_by(order_id) %>%
                summarise(products_in_cart = max(add_to_cart_order))        
ggplot(grouped_df, aes(products_in_cart)) + geom_bar(fill="salmon") + ggtitle("Frequecy of total products in an order") + theme(plot.title = element_text(hjust = 0.5))
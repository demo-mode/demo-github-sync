grouped_df <- order_products_prior %>%
                group_by(add_to_cart_order) %>%
                summarise(reordered_ratio = sum(reordered)/n())
ggplot(grouped_df[1:70,], aes(add_to_cart_order, reordered_ratio, group=1)) + geom_line(linetype=1, color="salmon", size=2)+ geom_point(size=1) + ggtitle("Add to Cart Reorder ratio") + theme(plot.title = element_text(hjust = 0.5)) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
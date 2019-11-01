library(ggplot2)
grouped_df <- orders %>%
                group_by(user_id) %>%
                summarise(total_orders= max(order_number))
ggplot(grouped_df, aes(total_orders)) + geom_bar(fill="salmon") + ggtitle("Frequecy of total orders") + theme(plot.title = element_text(hjust = 0.5))
grouped_df <- orders %>%
                        group_by(order_dow, order_hour_of_day) %>%
                        summarise(total_orders=n())
ggplot(grouped_df, aes(order_hour_of_day,order_dow)) + geom_tile(aes(fill = total_orders), colour = "white") + scale_fill_gradient(low = "white",
     high = "salmon") + ggtitle("Frequency of Day of week Vs Hour of day") + theme(plot.title = element_text(hjust = 0.5))
     
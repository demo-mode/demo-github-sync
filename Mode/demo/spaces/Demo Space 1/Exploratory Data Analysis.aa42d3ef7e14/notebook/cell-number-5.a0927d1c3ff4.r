library(dplyr)
library (ggplot2)
orders %>%
        group_by(eval_set) %>%
        summarise(users=n_distinct(user_id))


all_orders <- orders
sample_orders <- all_orders[sample(nrow(all_orders), size = 1000000),]

sample_orders$order_dow <- as.factor(sample_orders$order_dow)
sample_orders$order_dow <- factor(sample_orders$order_dow, 
                                  labels = c("Sunday", "Monday", "Tuesday", 
                                             "Wednesday", "Thursday", "Friday", "Saturday"))

ggplot(sample_orders, aes(order_dow)) +
    geom_bar(fill = "Salmon", col = "black") +
    labs(x = NULL, y = "Orders (thousands)", caption = "Figure 1. Total Organic Bananas orders placed by customers on each day.") +
    theme_classic() +
    theme(plot.title = element_text(hjust = 0.5, size = 20), 
          axis.text.x = element_text(size = 12, angle = 45, vjust = 0.6),
          axis.text.y = element_text(size = 12),
          axis.title.y = element_text(size = 15),
          plot.caption = element_text(size = 12, hjust = 0)) +
    scale_y_continuous(labels = function(x) x / 1000)
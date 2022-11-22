grouped_df1 <- orders %>%
                         group_by(days_since_prior_order) %>%
                         summarise(count=n(), na.rm = T)
ggplot(grouped_df1, aes(days_since_prior_order, count)) + geom_bar(stat="identity",fill="salmon") +
         ggtitle("Frequency distribution by days since prior order") + theme(plot.title = element_text(hjust = 0.5))
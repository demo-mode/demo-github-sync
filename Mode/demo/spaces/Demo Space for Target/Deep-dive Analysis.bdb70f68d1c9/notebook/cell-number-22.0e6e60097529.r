brfss_drink_state_sum <- brfss_drink_state %>%
    group_by(genhlth, x_state, x_rfbing5) %>%
    summarise(avedrink_mean = mean(avedrnk2),n=n()) %>%
    mutate(pct_total = n/sum(n))

ggplot(data= brfss_drink_state_sum, aes(genhlth, x_state)) + geom_tile(aes(fill = avedrink_mean)) + scale_fill_gradient(low= "thistle2", high= "darkred") 
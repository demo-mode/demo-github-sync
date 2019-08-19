brfss_drink_state_filter_sum <- brfss_drink_state_sum %>%
    select(genhlth, x_state, pct_total,x_rfbing5, avedrink_mean) %>%
    filter(x_rfbing5=="Yes") 

ggplot(data= brfss_drink_state_filter_sum, aes(genhlth, x_state)) + geom_tile(aes(fill = pct_total)) + scale_fill_gradient(low= "thistle2", high= "darkred") 
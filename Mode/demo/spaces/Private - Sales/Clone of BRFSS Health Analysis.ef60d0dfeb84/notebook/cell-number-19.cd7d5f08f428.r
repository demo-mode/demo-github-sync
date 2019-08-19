brfss_drink_state <- q1 %>%
    filter(!is.na(avedrnk2),!is.na(genhlth),!is.na(x_rfbing5)) %>%
               select(genhlth, x_state, avedrnk2, x_rfbing5)
               
ggplot(brfss_drink_state, aes(avedrnk2, ..density..,fill=genhlth))+geom_histogram(binwidth = 1, position= position_dodge(width = 0.75))
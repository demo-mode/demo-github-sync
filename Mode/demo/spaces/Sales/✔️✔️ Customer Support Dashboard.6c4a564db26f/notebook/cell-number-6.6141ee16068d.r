# Data Manipulation with dplyr: Create new data frame response_over_time
resolution_df <- time_df %>% 
select(RESOLUTION_TIME, DATE_BY_WEEK) %>%  # Subset data frame
group_by(DATE_BY_WEEK) %>%
summarise(number_of_tickets = n(), average_resolution_time = round(mean(RESOLUTION_TIME), digits = 0), 
median_resolution_time = round(median(RESOLUTION_TIME), digits = 0)) 


# Return DataFrame
resolution_df
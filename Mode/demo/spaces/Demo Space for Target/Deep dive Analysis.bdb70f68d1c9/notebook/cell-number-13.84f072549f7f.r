# Define Winter months

winter <- c("December","January","February")

q3 <- select(q1,genhlth,imonth,x_state) %>%
  na.omit() %>%
  mutate(winter=imonth %in% winter)
dim(q3)
states <- c("Alaska","California","Massachusetts","New Hampshire","Wyoming")

q3_states <- filter(q3,x_state %in% states)
dim(q3_states)
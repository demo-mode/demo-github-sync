q2_pop <- select(q2,sex,sleptim1) %>% na.omit() %>% filter(sleptim1 <= 16)
dim(q2_pop)
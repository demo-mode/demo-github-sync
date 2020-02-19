# And for parents of small children, the distribution looks like:
filter(q2_parent,young==TRUE) %>% summarize(avg=mean(sleptim1),sd=sd(sleptim1))
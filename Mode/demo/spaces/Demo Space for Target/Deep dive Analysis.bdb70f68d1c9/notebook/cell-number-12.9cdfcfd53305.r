# Finally, looking at gender differences for parents of small children:
filter(q2_parent,young==TRUE) %>% group_by(sex) %>% summarize(avg=mean(sleptim1),sd=sd(sleptim1))

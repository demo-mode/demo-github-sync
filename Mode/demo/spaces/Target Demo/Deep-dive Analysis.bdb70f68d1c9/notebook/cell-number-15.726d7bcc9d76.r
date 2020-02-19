#For this analysis, an extra column was added indicating if the interview took place in the months typically associated with winter.
#Looking at the proportion table (looking down both FALSE and TRUE columns), the reported health is very similar regardless of status of “winter collection”. This can be also visualized in the following plot:

g <- ggplot(q3)+aes(x=winter,fill=genhlth)+geom_bar(position = "fill")
g <- g + xlab("Winter interview per state") + ylab("Proportion") + scale_fill_discrete(name="Reported Health")
g
g <- ggplot(q2_pop) + aes(x=sleptim1) 
g <- g + geom_histogram(binwidth = 1, color="black", fill="white")
g <- g + xlab("Sleep Time (hrs)") + ylab("Reported Count")
g
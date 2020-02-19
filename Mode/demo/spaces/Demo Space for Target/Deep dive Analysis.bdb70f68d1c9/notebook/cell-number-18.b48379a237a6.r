options(repr.plot.width = 7)
options(repr.plot.height = 3)
g <- ggplot(q3_states)+aes(x=winter,fill=genhlth)+geom_bar(position = "fill")+facet_grid(.~x_state)
g <- g + xlab("Winter interview per state") + ylab("Proportion") + scale_fill_discrete(name="Reported Health")
g
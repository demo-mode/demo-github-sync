# Effect of Gender
g <- ggplot(q1) + aes(x=sex,fill=genhlth) + geom_bar(position = "fill") + facet_grid(.~x_bmi5cat)
g <- g + xlab("BMI category per Gender") + ylab("Proportion") + scale_fill_discrete(name="Reported Health")
g + theme(axis.text.x=element_text(angle=30, hjust=1))
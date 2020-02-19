# Research Question 1
# Graphically representing respondents based on their reported health and BMI category
options(repr.plot.width = 7)
options(repr.plot.height = 3)
g <- ggplot(q1) + aes(x=x_bmi5cat,fill=genhlth) + geom_bar(position = "fill") 
g <- g + xlab("BMI category") + ylab("Proportion") + scale_fill_discrete(name="Reported Health")
g + theme(axis.text.x=element_text(angle=30, hjust=1))
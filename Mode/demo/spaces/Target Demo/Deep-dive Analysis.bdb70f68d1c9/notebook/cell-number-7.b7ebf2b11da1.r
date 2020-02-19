# This data load performs two data selection operations:
# First, it selects the proper columns from the original dataset into the q2 data frame.
# It then creates two separate dataframes for analysis:
# q2_pop : for the broader population, omitting miscoded values.
# q2_parent : leverages the Random Child Selection set of questions from the BRFSS and selects those that identified themselves as “Parents”. Furthermore, it adds a column for identifying children less than 10 years old.
#It is important to note that while the broad population is approximately 480,000 samples, the Random Child Selection module of the BRFSS yields a little less than 60,000 samples.

q2_parent <- na.omit(q2) %>% filter(rcsrltn2=="Parent" & sleptim1 <= 16) %>%
  mutate(young=x_impcage %in% c("0-4 Years old","5-9 Years old"))
dim(q2_parent)
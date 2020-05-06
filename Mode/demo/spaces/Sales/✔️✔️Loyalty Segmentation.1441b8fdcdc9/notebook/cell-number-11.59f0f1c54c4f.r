dtree.cutoffs = optimize_cutoff(actual = train.data$y1, probability = predict.train[,2])
kable(dtree.cutoffs$best) %>% kable_styling(bootstrap_options = c("striped"))
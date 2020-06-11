time_df <- mutate_(time_df, DATE = ~format(as.POSIXct(time_df$DATE ,format="%m/%d/%y"),"%d-%b"))
time_df <- time_df[order(as.Date(as.POSIXct(time_df$DATE_BY_WEEK ,format="%m/%d/%y"),"%b-%d")), ]
time_df <- mutate_(time_df, DATE = ~format(as.POSIXct(time_df$DATE_BY_WEEK ,format="%m/%d/%y"),"%d-%b"))

tail(time_df, 3)
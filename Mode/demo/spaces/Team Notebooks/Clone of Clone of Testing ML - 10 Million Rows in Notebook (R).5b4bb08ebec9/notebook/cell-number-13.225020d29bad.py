# # Convert to factor
# sample_orders$order_dow <- as.factor(sample_orders$order_dow)

# sample_orders$order_dow <- factor(sample_orders$order_dow, 
#                                   labels = c("Sunday", "Monday", "Tuesday", 
#                                             "Wednesday", "Thursday", "Friday", "Saturday"))
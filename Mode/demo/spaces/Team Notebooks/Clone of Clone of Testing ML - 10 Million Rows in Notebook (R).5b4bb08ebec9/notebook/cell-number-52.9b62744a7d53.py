optimize_cutoff = function (actual, probability) {
  rocr.pred = prediction(predictions = probability, labels = actual)
  rocr.metrics = data.frame(
      cutoff   = rocr.pred@cutoffs[[1]],
      accuracy = (rocr.pred@tp[[1]] + rocr.pred@tn[[1]]) / 
                   (rocr.pred@tp[[1]] + rocr.pred@tn[[1]] + rocr.pred@fp[[1]] + rocr.pred@fn[[1]]),
      tpr = rocr.pred@tp[[1]] / (rocr.pred@tp[[1]] + rocr.pred@fn[[1]]),
      fpr = rocr.pred@fp[[1]] / (rocr.pred@fp[[1]] + rocr.pred@tn[[1]]),
      ppv = rocr.pred@tp[[1]] / (rocr.pred@tp[[1]] + rocr.pred@fp[[1]])
  )
  rocr.metrics$fscore = 2 * (rocr.metrics$tpr * rocr.metrics$ppv) / (rocr.metrics$tpr + rocr.metrics$ppv)
  rocr.metrics$tpr_fpr = rocr.metrics$tpr / rocr.metrics$fpr
  
  ## Discovery the optimal threshold for various metrics
  rocr.best = rbind(
    best.accuracy = c(max = max(rocr.metrics$accuracy, na.rm = TRUE), cutoff=rocr.metrics$cutoff[which.max(rocr.metrics$accuracy)]),
    best.ppv = c(max = max(rocr.metrics$ppv, na.rm = TRUE), cutoff = rocr.metrics$cutoff[which.max(rocr.metrics$ppv)]),
    best.recall = c(max = max(rocr.metrics$tpr, na.rm = TRUE), cutoff = rocr.metrics$cutoff[which.max(rocr.metrics$tpr)]),
    best.fscore = c(max = max(rocr.metrics$fscore, na.rm = TRUE), cutoff = rocr.metrics$cutoff[which.max(rocr.metrics$fscore)]),
    best.tpr_fpr = c(max = max(rocr.metrics$tpr_fpr, na.rm = TRUE), cutoff = rocr.metrics$cutoff[which.max(rocr.metrics$tpr_fpr)])
  )
  
  list(metrics = rocr.metrics, best = rocr.best)
}
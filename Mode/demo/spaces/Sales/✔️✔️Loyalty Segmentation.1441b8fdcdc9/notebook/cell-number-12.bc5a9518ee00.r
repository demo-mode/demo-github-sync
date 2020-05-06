binclass_eval = function (actual, predict) {
  cm = table(as.integer(actual), as.integer(predict), dnn=c('Actual','Predicted'))
  ac = (cm['1','1']+cm['0','0'])/(cm['0','1'] + cm['1','0'] + cm['1','1'] + cm['0','0'])
  pr = cm['1','1']/(cm['0','1'] + cm['1','1'])
  rc = cm['1','1']/(cm['1','0'] + cm['1','1'])
  fs = 2* pr*rc/(pr+rc)
  list(cm=cm, recall=rc, precision=pr, fscore=fs, accuracy=ac)
}
rocr.pred = prediction(predictions = predict.train[,2], labels = train.data$y)
rocr.perf = performance(rocr.pred, measure = "tpr", x.measure = "fpr")
rocr.auc = as.numeric(performance(rocr.pred, "auc")@y.values)
plot(rocr.perf,
     lwd = 3, colorize = TRUE,
     print.cutoffs.at = seq(0, 1, by = 0.1),
     text.adj = c(-0.2, 1.7),
     main = 'ROC Curve')
mtext(paste('auc : ', round(rocr.auc, 5)))
abline(0, 1, col = "red", lty = 2)
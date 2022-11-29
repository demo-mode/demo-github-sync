binclass_eval = function (actual, predict) {
  cm = table(as.integer(actual), as.integer(predict), dnn=c('Actual','Predicted'))
  ac = (cm['1','1']+cm['0','0'])/(cm['0','1'] + cm['1','0'] + cm['1','1'] + cm['0','0'])
  pr = cm['1','1']/(cm['0','1'] + cm['1','1'])
  rc = cm['1','1']/(cm['1','0'] + cm['1','1'])
  fs = 2* pr*rc/(pr+rc)
  list(cm=cm, recall=rc, precision=pr, fscore=fs, accuracy=ac)
}
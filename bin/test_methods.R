source("common/plots_2D.R")
source("common/models_dendrogram_v3.R")
source("common/methods_prob.R")
source("common/common.R")

init <- init_2D()
train <- init$train
test <- init$test

colnames(train)[ncol(train)] <- "Class"
colnames(test)[ncol(test)] <- "Class"

train$Class <- as.factor(sapply(train$Class, function(x) {paste("C", x, sep=".")}))
test$Class <- as.factor(sapply(test$Class, function(x) {paste("C", x, sep=".")}))

statsList <- list("OK"=c(), "ERROR"=c())

for (m in models) {
  preds <- runmethods(m, train, test)
  statsList[[predictionsStateProb(preds)]] <- c(statsList[[predictionsStateProb(preds)]], m)
  print(paste("Model", m, ":", predictionsStateProb(preds)))
  #print(paste(m, predictionsStateProb(preds)))
}

print("OK models:") 
for (em in statsList$OK) {
  print(paste("Model:", em))
}

print("ERROR models:") 
for (em in statsList$ERROR) {
  print(paste("Model:", em))
}

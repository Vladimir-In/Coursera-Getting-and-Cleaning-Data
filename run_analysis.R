run_analysis <- function()
  {
  #read features data
  features <- read.table("features.txt", header = FALSE)
  
  #read test and train data
  testX <- read.table("./test/X_test.txt", header = FALSE, sep = "")
  testy <- read.table("./test/y_test.txt", header = FALSE, sep = "")
  tests <- read.table("./test/subject_test.txt", header = FALSE)
  trainX <- read.table("./train/X_train.txt", header = FALSE, sep = "")
  trainy <- read.table("./train/y_train.txt", header = FALSE, sep = "")
  trains <- read.table("./train/subject_train.txt", header = FALSE)
  
  #assemble full test and train data
  testf <- cbind(tests, testy, testX)
  trainf <- cbind(trains, trainy, trainX)
  
  #merge test and train data
  datamerged <- rbind(testf, trainf)
  colnames(datamerged) <- c("subj", "feat", as.character(features$V2))

}

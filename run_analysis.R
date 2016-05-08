run_analysis <- function()
  {
  #necessary libraries
  library(dplyr)
  
  #read features data
  features <- read.table("features.txt", header = FALSE)
  
  #read test and train data
  testX <- read.table("./test/X_test.txt", header = FALSE, sep = "")
  testy <- read.table("./test/y_test.txt", header = FALSE, sep = "")
  tests <- read.table("./test/subject_test.txt", header = FALSE)
  trainX <- read.table("./train/X_train.txt", header = FALSE, sep = "")
  trainy <- read.table("./train/y_train.txt", header = FALSE, sep = "")
  trains <- read.table("./train/subject_train.txt", header = FALSE)
  activities <- read.table("activity_labels.txt", header = FALSE)
  
  #assemble full test and train data
  #measurements
  m_data <- rbind(testX, trainX)
  #activities
  a_data <- rbind(testy, trainy)
  #subjects
  s_data <- rbind(tests, trains)
  #replace activity labels with names
  activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
  a_data[,1] = activities[a_data[,1], 2]
  
  #merge test and train data
  datamerged <- cbind(s_data, a_data, m_data)
  colnames(datamerged) <- c("subject", "activity", as.character(features$V2))
  
  #select features with mean and standard deviation data
  fnames <- grep("-mean\\(\\)|-std\\(\\)", features$V2)
  
  #select columns with mean and standard deviation data
  datacleaned <- datamerged[c(1, 2, fnames + 2)]
  
  #group data by subjects and activities and find average measures of each group
  datacleaned <- datacleaned %>% 
    group_by(subject, activity) %>%
    summarize_each(funs(mean))
  
  #save resulting dataset in file
  write.table(datacleaned, "./cleaned_data_set.txt", row.names = FALSE)
  
}

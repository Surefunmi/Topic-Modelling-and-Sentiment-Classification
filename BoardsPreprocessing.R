#********Data Pre-processing**********

##Loading and installing required packages 
#install.packages("stringr")
library(stringr)

#For text mining
#install.packages("tm")
library(tm)

focus <- data.frame(boards_data$Comment)

##Creat Corpus
boardsCorpus <- Corpus(VectorSource(focus))
inspect(boardsCorpus) 

writeLines(as.character(boardsCorpus[[2]]))

Space <- content_transformer(function(x, pattern) 
  {return(gsub(pattern, " " , x))})

boardsCorpus <- tm_map(boardsCorpus, Space, "_")
boardsCorpus <- tm_map(boardsCorpus, Space, ":")
boardsCorpus <- tm_map(boardsCorpus, Space, ",")
boardsCorpus <- tm_map(boardsCorpus, Space, "'")
boardsCorpus <- tm_map(boardsCorpus, Space, " -")
boardsCorpus <- tm_map(boardsCorpus, Space, ".")
boardsCorpus <- tm_map(boardsCorpus, Space, ";")

#to remove punctuation marks
boardsCorpus <- tm_map(boardsCorpus, removePunctuation)

#to transform all characters to lower case
boardsCorpus <- tm_map(boardsCorpus, content_transformer(tolower))

#to remove stopwords from standard stopword list
boardsCorpus <- tm_map(boardsCorpus, removeWords, stopwords("english"))

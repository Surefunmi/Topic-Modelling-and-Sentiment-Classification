#********Data Pre-processing**********
setwd("C:/Users/hp/OneDrive - National College of Ireland/MSc. Research")
##Loading and installing required packages 
#install.packages("stringr") #to remove whitespace characters from the string
library(stringr)
#install.packages("rJava")
#install.packages("RWeka")
#install.packages("qdap")
#install.packages("textir")
#install.packages("maptpx")
library(rJava)
library(RWeka)
library(qdap)
library(textir)
library(maptpx)

#for hypothesis testing
#install.packages("infer")
#ibrary(infer)

#For text mining
#install.packages("tm")
library(tm)

#install.packages("SnowballC")
library(SnowballC)
#install.packages("wordcloud")
library(wordcloud)
 
#focus <- data.frame(boards_data$Comment)

#write.table(focus, file = "boardsPosts.tsv", quote = FALSE, sep = '\t', row.names = FALSE, col.names = FALSE)
#write_tsv(focus, file = "boardsPosts2.tsv", sep = '\t', row.names = FALSE, col.names = FALSE)
#Posts <- read_tsv("boardsPosts.tsv")


focus <- read.csv("boardstest.csv", stringsAsFactors = FALSE)
class(focus$Time)
focus$Time = 2019
replace.value(focus, names, from=NA, to=as.integer(0), verbose = FALSE)
focuscomment <- data.frame(focus$Comment)
View(focuscomment)
str(focuscomment)
focuscomment <- as.character(focuscomment)
#install.packages("sentimentr") to enable sentiment analysis
library(sentimentr)
focus_comment <- get_sentences(focuscomment) #to get the right data structure
#print(focus_comment)

##Create Corpus
boardsCorpus <- Corpus(VectorSource(focuscomment$focus.Comment))
inspect(boardsCorpus)

#to transform all characters to lower case
CleanCorpus <- tm_map(boardsCorpus, content_transformer(tolower))
inspect(CleanCorpus[1:5]) 
inspect(CleanCorpus[40:45])
#to remove punctuation marks
CleanCorpus <- tm_map(CleanCorpus, removePunctuation)
inspect(CleanCorpus[1:5]) 
#To remove numbers
CleanCorpus <- tm_map(CleanCorpus, removeNumbers)
inspect(CleanCorpus[1:5]) 

#to remove stopwords from standard stopword list
CleanCorpus <- tm_map(CleanCorpus, removeWords, c(stopwords("english"), "rent", "landlord", "dulin"))
inspect(CleanCorpus[1:5]) 
CleanCorpus <- tm_map(CleanCorpus, removeWords, c(" k","???","£"))

#to remove whitespace
CleanCorpus <- tm_map(CleanCorpus, stripWhitespace)
inspect(CleanCorpus[1:5]) 
#stringsAsFactors = FALSE
#CleanCorpus <- as.String(CleanCorpus)
CleanCorpus <- String(CleanCorpus)
wordcloud(CleanCorpus)
wordcloud(CleanCorpus, col = rainbow(7))
wordcloud(CleanCorpus, random.order = TRUE)

CleanCorpus_dtm <- TermDocumentMatrix(CleanCorpus)
CleanCorpus_m <- as.matrix(CleanCorpus_dtm)
dim(CleanCorpus_m)
inspect(CleanCorpus_dtm)

sentimenttest <- sentiment(focus_comment)
View(sentimenttest)

#avegare sentiment of all posts
mean_sentiment_score <- sum(sentimenttest$sentiment)/length(sentimenttest$sentmient)
mean_sentiment_score

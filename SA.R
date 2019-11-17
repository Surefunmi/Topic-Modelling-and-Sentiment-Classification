library(rvest)

boards.ie_webpage <- read_html("https://www.boards.ie/search/submit/?forum=38&sort=newest&date_to=&date_from=&query=rent")
#Fetching the title of each comment
title <- boards.ie_webpage %>%
  html_nodes("p.result_title") %>%
  html_text()

#Fetching comments only 
comments <- boards.ie_webpage %>%
  html_nodes("p.result_snippet")%>%
  html_text()
#checking some of the comments fetched
head(comments)
tail(comments)
#extracting the time (span) in which each comment was posted
time <- boards.ie_webpage %>%
  html_nodes("span.date")%>%
  html_text()

boards.ie_urls <- read_html
urls <- boards.ie_webpage %>%
  html_node("p.result_stats") %>%
  html_attr("href")

#creating a dataframe for each comment, time and title
boards_sentiment_data <- data.frame(Title=title, Comments=comment, PublishedTime=time)
dim(boards_data) #checking no of rows and columns in the dataframe


title <- c()
comment <- c()
time <- c()
for (i in boards_data$Comments) {
  boards_data <- read_html(i)
  body <- boards_data %>%
    html_nodes("p.result_snippet") %>%
    html_text()
  comment = append(comment, body)
  
  boards_sentiment_data <- read_html(i)
  time <- boards_data %>%
    html_nodes("span.date")%>%
    html_text()
  time = append(time, rep(time, each = length(body)))
  
}

#boards_final_data <- boards_data[grep("5 years", boards_data$PublishedTime)]
#dim(boards_final_data)



#writeLines(as.character(boardsCorpus[[2]]))

#Space <- content_transformer(function(x, pattern) 
# {return(gsub(pattern, " " , x))})

boardsCorpus <- tm_map(boardsCorpus, Space, "_")
boardsCorpus <- tm_map(boardsCorpus, Space, ":")
boardsCorpus <- tm_map(boardsCorpus, Space, ",")
boardsCorpus <- tm_map(boardsCorpus, Space, "'")
boardsCorpus <- tm_map(boardsCorpus, Space, " -")
boardsCorpus <- tm_map(boardsCorpus, Space, ".")
boardsCorpus <- tm_map(boardsCorpus, Space, ";")

stringsAsFactors = FALSE
focus2comment <- as.character(focus2comment)

CleanCorpus_dtm <- DocumentTermMatrix(CleanCorpus, control = list(
  stripWhitespace = TRUE,
  tolower = TRUE,
  removePunctuation = TRUE,
  removeNumbers = TRUE,
  stopwords = TRUE
  
))

dublin[dublin$Time %in% look.for, ]

which(dublin == "10 months, 3 weeks", arr.ind=TRUE)
which(startsWith(dublin$Time, "10 months, 3 weeks"))
dublin[1:103,1] = 2019
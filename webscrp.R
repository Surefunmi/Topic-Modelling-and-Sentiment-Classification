test <- read_html("https://www.boards.ie/search/submit/?forum=38&sort=newest&date_to=&date_from=&query=rent")
title2 <- test %>%
  html_nodes("p.result_title") %>%
  html_text()

title1 <- test %>%
  html_node("p.result_wrapper") %>%
  html_text()

comment <- test %>%
  html_nodes("p.result_snippet")%>%
  html_text()

time <- test %>%
  html_nodes("span.date")%>%
  html_text()

boards.ie_webpage %>%
  html_nodes("p.result_stats")%>%
  html_text()

urls <- boards.ie_webpage %>%
  html_node("p.result_stats") %>%
  html_attr("href")

boards_data <- data.frame(Comments=comments, PublishedTime=time)

boards.ie_comments <- read_html("https://www.boards.ie/search/submit/?query=rent")  

urls <- boards.ie_comments %>%
  html_nodes("div.result_wrapper") %>%
  html_attr("href")


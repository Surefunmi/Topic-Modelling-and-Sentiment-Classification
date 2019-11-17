setwd("C:/Users/hp/OneDrive - National College of Ireland/MSc. Research")

#**********Removing all objects, as well as hidden objects**********
rm(list = ls(all.names = TRUE)) 
#gc()

#**********Installing and loading rvest package to parse HTML/XML files
install.packages("rvest", dependencies = TRUE)
library(rvest)

#**********Installed and loaded tidyverse package for effective data manipulation 
#install.packages("tidyverse")
library(tidyverse)

#**********Includes map functions for manipulating vectors
#install.packages("purrr")
library(purrr)

#**********Works hand in hand with rvest**********
#install.packages("xml2")
library(xml2)
#install.packages("Rcrawler")
#library(Rcrawler)
#install.packages("Rcurl")
#library(RCurl)

#**********Data Extraction via Web Scrapping
#Reading the html file of a particular forum (Accommodation & Property) in boards.ie**********
boards.ie_webpage <- read_html("https://www.boards.ie/search/submit/?forum=38&sort=newest&date_to=&date_from=&query=rent")
str(boards.ie_webpage)

boards_test <- "https://www.boards.ie/search/submit/?forum=38&sort=newest&date_to=&date_from=&query=rent&page=%d"

#Scrapping all "Rent" posts pages and creating a dataframe 
map_df(1:3, function(i){
  
  page <- read_html(sprintf(boards_test, i))
  data.frame(Time = html_text(html_nodes(page, ".date")),
             Title = html_text(html_nodes(page, ".result_title")),
             Comment = html_text(html_nodes(page, ".result_snippet"))
             )
}) -> boards_data  

#to inspect the data in csv format
write.csv(boards_data, file = "boardstest.csv")

  
            




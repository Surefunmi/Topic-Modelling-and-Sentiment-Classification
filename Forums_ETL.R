setwd("C:/Users/hp/OneDrive - National College of Ireland/MSc. Research")

#**********Removing all objects, as well as hidden objects**********
rm(list = ls(all.names = TRUE)) 
#gc()

#**********Installing and loading rvest package to parse HTML/XML files
#install.packages("rvest", dependencies = TRUE)
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

#**********Data Extraction via Web Scrapping for DUBLIN CITY FORUM
#Reading the html file of a particular forum (Accommodation & Property) in boards.ie**********
dublin_webpage <- read_html("https://www.boards.ie/search/submit/?forum=474&sort=newest&showmore=1&date_to=&date_from=&query=rent&page=1")
str(dublin_webpage)

dublin_test <- "https://www.boards.ie/search/submit/?forum=474&sort=newest&showmore=1&date_to=&date_from=&query=rent&page=%d"

#Scrapping all "Rent" posts pages and creating a dataframe 
map_df(1:181, function(i){
  
  page <- read_html(sprintf(dublin_test, i))
  data.frame(Time = html_text(html_nodes(page, ".date")),
             Title = html_text(html_nodes(page, ".result_title")),
             Comment = html_text(html_nodes(page, ".result_snippet"))
  )
}) -> dublin_data  

write.csv(dublin_data, file = "dublin_data.csv") #to inspect the data in csv format

dublin <- read.csv("dublin_data.csv", stringsAsFactors = FALSE) #read csv file
dublin <- dublin[,-1]

which(grepl("10 months, 3 weeks", dublin$Time))
dublin[1:103,1] = 2019
which(grepl("1 year, 11 months", dublin$Time))
dublin[104:224,1] = 2018
which(grepl("2 years, 11 months", dublin$Time))
dublin[225:413,1] = 2017
which(grepl("3 years, 11 months", dublin$Time))
dublin[413:580,1] = 2016
which(grepl("4 years, 11 months", dublin$Time))
dublin[581:790,1] = 2015
which(grepl("5 years, 11 months", dublin$Time))
dublin[791:1108,1] = 2014
which(grepl("6 years, 11 months", dublin$Time))
dublin[1109:1378,1] = 2013
which(grepl("7 years, 11 months", dublin$Time))
dublin[1379:1687,1] = 2012
which(grepl("8 years, 11 months", dublin$Time))
dublin[791:1108,1] = 2011
which(grepl("9 years, 11 months", dublin$Time))
dublin[791:2139,1] = 2010



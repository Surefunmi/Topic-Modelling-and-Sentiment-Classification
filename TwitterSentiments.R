setwd("C:/Users/hp/OneDrive - National College of Ireland/MSc. Research")

#install.packages("twitterR")
library(twitteR)
#install.packages("ROAuth")
library(ROAuth)
#install.packages("rvest")
library(rvest)
#install.packages("RCurl")
library(RCurl)
# install.packages("devtools")
# install.packages("tm")
# install.packages("SnowballC")
# install.packages("syuzhet")

library("devtools")
library("tm")
library("SnowballC")
library("syuzhet")


install.packages("base64enc")
install.packages("memoise")
install.packages("whisker")
install.packages("rstudioapi")
install.packages("git2r")
install.packages("withr") 
install.packages("rjson")
install.packages("bit64")
install.packages("httr")
install.packages("httpuv")
                    
library(c("base64enc","memoise","whisker","rstudioapi",
          "git2r","withr","rjson","bit64","httr","httpuv"))

library("base64enc")
library("memoise")
library("whisker")
library("rstudioapi")
library("git2r")
library("withr")
library("rjson")
library("bit64")
library ("httr")
library ("httpuv")

api_key = "sk3kl8hTNBfCe6LAftNj4HFfh"
api_secret = "xIMy2JMKFIO39gDOQ2elG5YSmKDiGVSYOe4sJhepi5vtEQ9UQt"
access_token = "328069252-XO0bkZQQ9TpxJHsFc6JAmSiGKd485Atam0ziIZik"
access_token_secret = "DDsNjJDMkjF3tQ2awRuYOgyKDz9XHtJTR9ZJqCycXEOKh"
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

rent = searchTwitter("rent_in_ireland OR #rent_in_ireland OR accommodation_in_ireland OR 
                      #accommodation_in_ireland OR housing_in_ireland OR #housing_in_ireland",
                     n = 10000, lang = 'en')

rent2 = searchTwitter("housing_problem_in_ireland OR accommodation_in_dublin OR #accommodation_in_dublin OR
                      #housing_in_dublin OR housing_in_dublin OR housing_problem_in_dublin",
                      n = 10000, lang = 'en')

rent3 <- userTimeline("MyHomeProperty", n= 3000)
rent4 <- userTimeline("daftmedia", n= 1000)
rent5 <- userTimeline("dublinhebrew", n= 10000)
rent6 <- userTimeline("RentalProperty8", n= 3000)



data1 <- twListToDF(rent)
data2 <- twListToDF(rent2)
data3 <- twListToDF(rent3)
data4 <- twListToDF(rent4)
data5 <- twListToDF(rent5)


write.csv(data1, file = "Tweets1.csv")
write.csv(data2, file = "Tweets2.csv")
write.csv(data3, file = "Tweets3.csv")
write.csv(data4, file = "Tweets4.csv")
write.csv(data5, file = "Tweets5.csv")



#housing_tweets1 = searchTwitter('$housing_problem_in_ireland, accommodation_in_ireland, #accommodation_in_ireland,
 #                               accommodation_in_dublin, #accommodation_in_dublin, #housing_in_ireland', 
  #                              n = 10000, lang = 'en', resultType = "recent")



#rent1 = searchTwitter("rent OR rent_in_ireland OR #rent OR #rent_in_ireland OR accommodation_in_ireland OR 
                     #accommodation_in_ireland OR accommodation OR #accommodation OR housing OR #housing OR 
 #                    housing_in_ireland OR #housing_in_ireland", n = 1000, lang = 'en')

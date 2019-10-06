#install.packages("twitterR")
library(twitteR)
#install.packages("ROAuth")
library(ROAuth)
#install.packages("RCurl")
library(RCurl)

install.packages("base64enc","devtools","memoise","whisker","rstudioapi",
                 "git2r","withr","rjson","bit64","httr","httpuv")
library("base64enc")
library("devtools")
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
                      #accommodation_in_ireland OR housing_in_ireland OR #housing_in_ireland", n = 3000, lang = 'en')

data1 <- twListToDF(rent)


#housing_tweets1 = searchTwitter('$housing_problem_in_ireland, accommodation_in_ireland, #accommodation_in_ireland,
 #                               accommodation_in_dublin, #accommodation_in_dublin, #housing_in_ireland', 
  #                              n = 10000, lang = 'en', resultType = "recent")



#rent1 = searchTwitter("rent OR rent_in_ireland OR #rent OR #rent_in_ireland OR accommodation_in_ireland OR 
                     #accommodation_in_ireland OR accommodation OR #accommodation OR housing OR #housing OR 
 #                    housing_in_ireland OR #housing_in_ireland", n = 1000, lang = 'en')

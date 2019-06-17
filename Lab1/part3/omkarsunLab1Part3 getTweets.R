#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)

library(rtweet)

## authenticate via access token
token <- create_token(
  app = "Twitter with R123",
  consumer_key = "8InsjGGJGkPl1Kt2jrEoMm3BD",
  consumer_secret = "SDVWDeItox0YLcnaa4TKKrqftDIWUxN6cvjqPtoSdk9QMUqS1C",
  acess_token = "9551451262-wK2EmA942kxZYIwa5LMKZoQA4Xc2uyIiEwu2YXL",
  access_secret = "9vpiSGKg1fIPQtxc5d5ESiFlZQpfbknEN1f1m2xe5byw7")


list <-c('flu','fluseason','cough','influenza')
for(i in list)
{
  rt <- search_tweets(i, n = 5000, include_rts = FALSE,geocode = lookup_coords("USA"))
  save_as_csv(rt, file_name = i)
}







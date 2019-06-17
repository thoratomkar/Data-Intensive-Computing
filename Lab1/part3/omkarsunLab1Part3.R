#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)

## https://stat.ethz.ch/R-manual/R-devel/library/base/html/duplicated.html
## https://cran.r-project.org/web/packages/hashmap/README.html
## https://cran.r-project.org/web/packages/usmap/vignettes/mapping.html


library(ggplot2)
library(maps)
library(ggmap)
library(maptools)
library(hashmap)
library(openintro)
library(usmap)
library(tidyverse)


# read all the files and combine them for all keywords

# file1<- read.csv("#cough.csv")
# file2<-read.csv("#cough223.csv")
# 
# file3<- read.csv("#flu.csv")
# file4<-read.csv("#flu223.csv")
# 
# file5<- read.csv("#fluseason.csv")
# file6<-read.csv("#fluseason223.csv")
# 
# file7<- read.csv("#influenza.csv")
# file8<-read.csv("#influenza223.csv")
# 
# file9<- read.csv("cough.csv")
# file10<-read.csv("flu.csv")
# file11<- read.csv("fluseason.csv")
# file12<-read.csv("influenza.csv")
# 
# myfulldata = rbind(file1,file2)
# myfulldata = rbind(myfulldata,file3)
# myfulldata = rbind(myfulldata,file4)
# myfulldata = rbind(myfulldata,file5)
# myfulldata = rbind(myfulldata,file6)
# myfulldata = rbind(myfulldata,file7)
# myfulldata = rbind(myfulldata,file8)
# myfulldata = rbind(myfulldata,file9)
# myfulldata = rbind(myfulldata,file10)
# myfulldata = rbind(myfulldata,file11)
# myfulldata = rbind(myfulldata,file12)
# 
# 
# write.csv(myfulldata,file="fulldata.csv")


## Data processing 
data <- read.csv("fulldata.csv")
new_data <-  data[!duplicated(data$text), ]
loc <- as.character(new_data$location)

EE <- new.env(hash = TRUE)
set.seed(123)
x<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
new <-c('AL','AK','AZ','AR','CA','CO','CT','DC','DE','FL','GA','HI','ID'
        ,'IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT',
        'NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD',
        'TN','TX','UT','VT','VA','WA','WV','WI','WY','New York City','Peurto Rico','Virgin Islands')


## Counting number of tweets in each state
H <- hashmap(new,x)

for(i in H$keys())
  for(j in loc)
    
    if(grepl(i, j))
    {
      H[[i]]<-H[[i]]+1
      
    }


x <- abbr2state(H$keys())
x<-data.frame(x,H$keys(),H$values())
newdata <- x[order(H$values()),] 
newdata <- setNames(newdata, c("state","abbr","data1"))
y<-c(1,1,1,1,1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4
     ,5,5,5,5,5,6,6,6,6,6,7,7,7,7,7,8,8,8,8,8,9,9,9,9,9
     ,10,10,10,10,10)
newdata$val <- y

newdata <- newdata[order(newdata$state),]
newdata <-data.frame(newdata)
x<-as.numeric(newdata$val)
newdata <- newdata[1:51,]

#png("tweets.png",width=600,height=600)

## used plot_us map for alaska and hawaii
plot_usmap(data = newdata, values = "data1", lines = "red") + 
  scale_fill_continuous(
    low = "pink", high = "red4", name = "Number of Tweets", label = scales::comma
  ) + theme(legend.position = "right")+labs(title="Tweets Season-2018 2019")


#dev.off()



## NON Alaska Hawaii code

# states <- map_data("state")
# n <- ggplot()
# n <-  n +geom_map(data=states, map=states,col="black",
#                   aes(x=long, y=lat, map_id=region),size=0.5)
# 
# n <- n +geom_map(data=file,map=states,
#                  aes(fill=x, map_id=tolower(STATENAME)))+
#   theme(axis.text.x = element_blank(),
#         axis.text.y = element_blank(),
#         axis.ticks = element_blank(),
#         rect = element_blank())+
#   
#   ggtitle("US States as per Number of Tweets")+ 
#   theme(plot.title = element_text(hjust = 0.5))+
#   labs(x="", y="")+
#   scale_fill_continuous(low='#5bf700', high='#cc0000', 
#                         guide='colorbar')
# 
# n




##POINTS CODE

#register_google(key ='AIzaSyCA4hHccC5BtS0lRWMO7fX-hjz6_7g5pUU')
#geo <- geocode(as.character(loc))
#visit.x <- geo$lon
#visit.y <- geo$lat
#new <-data.frame(visit.x,visit.y)
#write.csv(new,file="locations.csv")
#new <- read.csv(file="locations.csv")


# new <- read.csv(file="locations.csv")
# visit.x <- new$visit.x
# visit.y <- new$visit.y
# dev.new(width=7,height=7)
# map("state",boundary=TRUE,fill=TRUE,col="white")
# points(visit.x,visit.y,col="red", pch='.',cex=4)







 

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

 file1<- read.csv("#influenza.csv")
 file2<-read.csv("#influenza223.csv")
 file3<-read.csv("influenza.csv") 
 file4<- read.csv("influenza228.csv")
 
 
 myfulldata = rbind(file1,file2)
 myfulldata = rbind(myfulldata,file3)
 myfulldata = rbind(myfulldata,file4)
 

## Data processing 

new_data <-  myfulldata[!duplicated(myfulldata$text), ]
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

#png("influenza.png",width=600,height=600)

## used plot_us map for alaska and hawaii
plot_usmap(data = newdata, values = "data1", lines = "red") +
  scale_fill_continuous(
    low = "pink", high = "red4", name = "Number of Tweets", label = scales::comma
  ) + theme(legend.position = "right")+labs(title = "INFLUENZA SUMMARY")


#dev.off()













# read all the files and combine them for all keywords

file1<- read.csv("#flu.csv")
file2<-read.csv("#flu.csv")
file3<-read.csv("flu.csv") 
file4<- read.csv("flu.csv")

myfulldata = rbind(file1,file2)
myfulldata = rbind(myfulldata,file3)
myfulldata = rbind(myfulldata,file4)

## Data processing 

new_data <-  myfulldata[!duplicated(myfulldata$text), ]
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

#png("flu.png",width=600,height=600)

## used plot_us map for alaska and hawaii
plot_usmap(data = newdata, values = "data1", lines = "red") +
  scale_fill_continuous(
    low = "pink", high = "red4", name = "Number of Tweets", label = scales::comma
  ) + theme(legend.position = "right")+labs(title = "FLU SUMMARY")


#dev.off()







# read all the files and combine them for all keywords

file1<- read.csv("#cough.csv")
file2<-read.csv("#cough.csv")
file3<-read.csv("cough.csv") 
file4<- read.csv("cough.csv")

myfulldata = rbind(file1,file2)
myfulldata = rbind(myfulldata,file3)
myfulldata = rbind(myfulldata,file4)

## Data processing 

new_data <-  myfulldata[!duplicated(myfulldata$text), ]
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

#png("cough.png",width=600,height=600)

## used plot_us map for alaska and hawaii
plot_usmap(data = newdata, values = "data1", lines = "red") +
  scale_fill_continuous(
    low = "pink", high = "red4", name = "Number of Tweets", label = scales::comma
  ) + theme(legend.position = "right")+labs(title = "COUGH SUMMARY")


#dev.off()








# read all the files and combine them for all keywords

file1<- read.csv("#fluseason.csv")
file2<-read.csv("#fluseason.csv")
file3<-read.csv("fluseason.csv") 
file4<- read.csv("fluseason.csv")

myfulldata = rbind(file1,file2)
myfulldata = rbind(myfulldata,file3)
myfulldata = rbind(myfulldata,file4)

## Data processing 

new_data <-  myfulldata[!duplicated(myfulldata$text), ]
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

#png("fluseason.png",width=600,height=600)

## used plot_us map for alaska and hawaii
plot_usmap(data = newdata, values = "data1", lines = "red") +
  scale_fill_continuous(
    low = "pink", high = "red4", name = "Number of Tweets", label = scales::comma
  ) + theme(legend.position = "right")+labs(title = "FLUSEASON SUMMARY")


#dev.off()


#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)


# import library and read file and process data
library(ggplot2)
library(maps)
data<- read.csv("StateDataforMap_2018-19week4.csv")
# Reference :http://www.endmemo.com/program/R/gsub.php
data$Val<- gsub("Level ","", data$ACTIVITY.LEVEL)
activity<-as.numeric(data$Val)
states <- map_data("state")

#png("cdcheatmap.png")
# Creating ggplot and addding geom_map to it
# Reference : https://stackoverflow.com/questions/24441775/how-do-you-create-a-us-states-heatmap-based-on-some-values
# Reference :https://ggplot2.tidyverse.org/reference/scale_colour_continuous.html
# Reference :https://stackoverflow.com/questions/40980189/removing-latitude-and-longitude-labels-in-ggplot/40980478
map <- ggplot()
map <-  map +geom_map(data=states, map=states,
                    aes(x=long, y=lat, map_id=region), lines = "black",size=0.5)
map <- map +geom_map(data=data,map=states,
           aes(fill=activity, map_id=tolower(STATENAME)))+
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        rect = element_blank())+
  
  ggtitle("2018-19 Influenza Season Week 4 ending Jan 27, 2019")+ 
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x="", y="")+
  scale_fill_continuous(low='#5bf700', high='#cc0000', 
                        guide='colorbar')
# Display the map
map
#dev.off()








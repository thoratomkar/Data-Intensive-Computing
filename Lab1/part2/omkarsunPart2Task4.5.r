#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)


#Reading the file and processing the data 
data <-read.csv("Weekly.csv")
data <-data[1:173,]
c1 <- toString(sum(data$NO..OF.DEATHS[1:52]))
c2 <- toString(sum(data$NO..OF.DEATHS[53:104]))
c3 <- toString(sum(data$NO..OF.DEATHS[105:156]))
c4 <- toString(sum(data$NO..OF.DEATHS[157:173]))
x <- data.frame(data$PREVIOUS.WEEK.DEATHS,data$CURRENT.WEEK.DEATHS)
r <-c(paste('2015-2016 \n Number of Deaths \n Reported=',c1),
      paste('2016-2017 \n Number of Deaths \n Reported=',c2),
      paste('2017-2018 \n Number of Deaths \n Reported=',c3),
      paste('2018-2019 \n Number of Deaths \n Reported=',c4))
week <-data.frame(data$WEEK.NUMBER)
i<-0
temp <- as.character(week$data.WEEK.NUMBER)
new<-c()

#take every 6th week for x axis label
while(i<nrow(data))  
{
  if(i %% 6==0 || i==0)
  {
    new[[i+1]] <-temp[i+1]
  }
  else
  {
    new[[i+1]] <-""
  }
  i <- i+1
}
new[[i]]<-temp[i]

#png("Deaths.png",width=600,height=600)
# Reference :https://www.statmethods.net/graphs/bar.html
# Barplot
b <- barplot(t(x),main="Number of Infulenza-Associated Pediatric Deaths \n by Week of Death 2015-2016 season to present",
        xlab="Week of death", col=c("dark green","light blue"),ylim=c(0,30),ylab="Number of Deaths")


# Reference :https://www.statmethods.net/advgraphs/axes.html
# Adding axis
axis(side=1,at=b,labels=new,las=2,cex.axis=0.7)

# Adding text to the plot
text(27,20,r[1],cex = 0.9)
text(88,20,r[2],cex = 0.9)
text(144,20,r[3],cex = 0.9)
text(199,20,r[4],cex = 0.9)

# Reference :http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way
# Adding legend
legend("topleft",c("Deaths Previous Week","Deaths Current Week"),fill=c("dark green","light blue")
       ,cex=0.7,text.font = 6,bty="n")

#dev.off()
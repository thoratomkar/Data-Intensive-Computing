#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)


#Replicate for NY for whole year
data <-read.csv("WHO_NREVSS_Clinical_LabsNY.csv")
data <- data[18:69,]
x <- data.frame(data$TOTAL.A,data$TOTAL.B)

#Combining the year and week column to make the x axis values unique
# Reference :https://www.rdocumentation.org/packages/base/versions/3.5.2/topics/factor
data$Year.Week <- paste(data$YEAR,data$WEEK)
x1 <- as.character(data$Year.Week)
x1 <- factor(x1, levels=unique(x1))

png("clinicalNY.png",width=600,height=600)
#Plotting the plot
# Reference :https://www.statmethods.net/graphs/bar.html
# Reference :https://stackoverflow.com/questions/10286473/rotating-x-axis-labels-in-r-for-barplot
b<-barplot(t(x),main="Influenza Positive Tests Reported To CDC by US Clinical Laboratories,\n National Summary, 2018-2019 Season",
           xlab="Week", col=c("yellow","green"),ylim=c(0,25000),ylab="Number of Positive Specimens")


par(mar = c(5,5,2,5))
with(x,barplot(t(x),main="Influenza Positive Tests Reported To CDC by US Clinical Laboratories,\n New York Summary, 2017-2018 52 Weeks Season ",
               xlab="Week", col=c("yellow","green"),ylim=c(0,25000),ylab="Number of Positive Specimens"))
text(cex=0.7,x=b-0.25,y=b-990.25,x1,xpd=TRUE,srt=60)

par(new=T)

with(x,plot(x1, data$PERCENT.POSITIVE,axes=F,pch=16,xlab=NA,ylab=NA,cex=1.2,ylim=c(0,35),lwd=0))

axis(side=4)

#Adding the lines
# Reference :https://www.statmethods.net/graphs/line.html
lines(x1,data$PERCENT.POSITIVE,col="black",type="l",lwd=1)
lines(x1,data$PERCENT.A,col="gold",type="l",lty=2,lwd=1)
lines(x1,data$PERCENT.B,col="darkgreen",type="l",lty=2,lwd=1)
mtext(side=4,line=3,"Percent Positive")


# Adding the legend
# Reference :http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way
legend("top",c("Percent Positive","% Positive Flu A",
                "% Positive Flu B"),col=c("black","gold","darkgreen")
       ,lwd=1,lty=c(1,2,2),cex=0.67,bty="n")
legend("topright",c("A","B"),fill=c("yellow","green"),cex=0.7,bty="n")

dev.off()

#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)


# Read the file and process it
data <-read.csv("WHO_NREVSS_Clinical_Labs.csv")
data <- data[1:17,]
x <- data.frame(data$TOTAL.B,data$TOTAL.A)

#Combining the year and week column to make the x axis values unique
# Reference :https://www.rdocumentation.org/packages/base/versions/3.5.2/topics/factor
data$Year.Week <- paste(data$YEAR,data$WEEK)
x1 <- as.character(data$Year.Week)
x1 <- factor(x1, levels=unique(x1))

#png("clinical.png",width=600,height=600)
#Plotting the plot
par(mar = c(5,5,2,5))
# Reference :https://www.statmethods.net/graphs/bar.html
# Reference :https://stackoverflow.com/questions/10286473/rotating-x-axis-labels-in-r-for-barplot
b <- with(x,barplot(t(x),main="Influenza Positive Tests Reported To CDC by US Clinical Laboratories,\n National Summary, 2018-2019 Season",
             xlab="Week", col=c("green","yellow"),ylim=c(0,14000),ylab="Number of Positive Specimens"))
text(cex=0.7,x=b-0.25,y=b-720.25,data$Year.Week,xpd=TRUE,srt=60)

par(new=T)

with(x,plot(x1, data$PERCENT.POSITIVE,axes=F,pch=16,xlab="",ylab="",cex=1,ylim=c(0,35),lwd=0),xaxt="n")
axis(side=4)

#Adding the lines
# Reference :https://www.statmethods.net/graphs/line.html
lines(x1,data$PERCENT.POSITIVE,col="black",type="l",lwd=1)
lines(x1,data$PERCENT.A,col="gold",type="l",lty=2,lwd=1)
lines(x1,data$PERCENT.B,col="darkgreen",type="l",lty=2,lwd=1)
mtext(side=4,line=3,"Percent Positive")

# Adding the legend
# Reference :http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way
legend("left",c("Percent Positive","% Positive Flu A",
"% Positive Flu B"),col=c("black","gold","darkgreen"),lwd=1,lty=c(1,2,2),horiz = FALSE,cex=0.9,bty="n")
legend("topleft",c("A","B"),fill=c("yellow","green"),cex=0.9,bty="n")


#dev.off()











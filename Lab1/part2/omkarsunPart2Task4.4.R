#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)

#Reading the CSV data file in a dataframe
df <-read.csv("NCHSData07.csv")


#Combining the Year and Week Column to make the x axis values unique
#Reference: http://www.endmemo.com/program/R/gsub.php
df$Year.Week <- paste(df$Year,df$Week)
df$Year.Week<-gsub(" ","",df$Year.Week)
x1 <- as.character(df$Year.Week)
x1 <- factor(x1, levels=unique(x1))
y <- factor(df$Week, levels=unique(df$Week))


#Saving the Graph
#png("mortality.png",width=600,height=600)


#plotting the bargraph
#Reference: https://www.statmethods.net/graphs/bar.html
b<-plot(x1, df$Expected, main = "Pneumonia and Influenza Mortality from the National Center for 
     Health Statistics Mortality Surveillance System",type="n", xlim = c(220,420),ylim=c(4,12), 
     xlab="MMWR Week", ylab="% of All Deaths Due to P & I", lwd = 3, cex.axis= 0.5)


#Plotting the line charts
#Reference:https://www.statmethods.net/graphs/line.html
lines(x1, df$Percent.of.Deaths.Due.to.Pneumonia.and.Influenza, type="l", col="red", lwd = 2)
lines(x1, df$Threshold, type="l",col="black", lwd = 2)
lines(x1, df$Expected,type="l",col="black", lwd = 2)

#dev.off()


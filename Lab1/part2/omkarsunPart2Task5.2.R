#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)

#Replication for 52 weeks

#Reading the CSV data file in a dataframe
df <- read.csv("WHO_NREVSS_Public_Health_Labs2.csv")

#Processing the dataframe and selecting the columns for plotting the graph
df <- df[122:173,]
y<-data.frame(df$BYam,df$BVic,df$B,df$H3N2v,df$A..H3.,df$A..2009.H1N1.,df$A..Subtyping.not.Performed.)


#Combining the Year and Week Column to make the x axis values unique
#Reference: http://www.endmemo.com/program/R/gsub.php
df$Year.Week <- paste(df$YEAR,df$WEEK)
dfYear.Week<-gsub(" ","",df$Year.Week)
date <- as.character(df$Year.Week)
date <- factor(date, levels=unique(date))


#Saving the Graph
#png("public52.png",width=600,height=600)


#plotting the bargraph
#Reference: https://www.statmethods.net/graphs/bar.html
bp <- barplot(t(y), 
              col = c("green", "#cdff35", "#3DD074", "blueviolet", "red","orange","yellow"),
              main = "Influenza Positive Tests Reported to CDC by U.S. Public Health Laboratories,
              National Summary, 2017-2018 Season", xlab="Week",
              ylab=("Number of Positive Specimens"),ylim=c(0,5000))


#Plotting the legends for understanding of the end user
#Reference: http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way
legend("topright", inset=.05, c("A (subtyping not performed)","A (H1N1)pdm09","A (H3N2)",
       "H3N2v","B (Lineage not performed)","B (Victoria Lineage)","B (Yamagata Lineage)"), 
       fill=c("yellow","orange","red","blueviolet","#3DD074","#cdff35","green"),  cex=0.65, text.font=1, bty="n")


#Formatting the labels on X axis
#Reference: https://stackoverflow.com/questions/10286473/rotating-x-axis-labels-in-r-for-barplot
text(cex=0.75, x=bp-.25, y=bp-270.25, date, xpd=TRUE, srt=60)

#dev.off()
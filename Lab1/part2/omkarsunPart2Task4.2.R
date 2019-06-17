#Group Members: Omkar Thorat (omkarsun) and Abhishek Bhave (abhave)

#Reading the CSV data file in a dataframe
df <- read.csv("FluView_StackedColumnChart_Data.csv")


#Processing the dataframe and selecting the columns for plotting the graph
df <- df[1:17,]
y<-data.frame(df$BYam, df$BVic, df$B,df$H3N2v, df$A..H3., df$A..2009.H1N1., df$A..Subtyping.not.Performed.)



#Combining the Year and Week Column to make the x axis unique
#Reference: http://www.endmemo.com/program/R/gsub.php
df$Year.Week <- paste(df$YEAR,df$WEEK)
dfYear.Week<-gsub(" ","",df$Year.Week)
date <- as.character(df$Year.Week)
date <- factor(date, levels=unique(date))


#Saving the Graph
#png("public.png",width=600,height=600)


#plotting the bargraph
#Reference: https://www.statmethods.net/graphs/bar.html
bp <- barplot(t(y), 
              col = c("green", "#cdff35", "#3DD074", "blueviolet", "red","orange","yellow"),
              main = "Influenza Positive Tests Reported to CDC by U.S. Public Health Laboratories,
              National Summary, 2018-2019 Season", xlab="Week",
              ylab=("Number of Positive Specimens"), ylim=c(0,3000), axes=TRUE)


#Plotting the legends for understanding of the end user
#Reference: http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way
legend("topleft", inset=.05, c("A (subtyping not performed)","A (H1N1)pdm09","A (H3N2)",
       "H3N2v","B (Lineage not performed)","B (Victoria Lineage)","B (Yamagata Lineage)"), 
       fill=c("yellow","orange","red","blueviolet","#3DD074","#cdff35","green"), cex=0.85, text.font=1, bty="n")


#Formatting the labels on X axis
#Reference: https://stackoverflow.com/questions/10286473/rotating-x-axis-labels-in-r-for-barplot
text(cex=0.75, x=bp-.25, y=bp-140.25, date, xpd=TRUE, srt=60)

#dev.off()
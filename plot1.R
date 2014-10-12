plot1 <- function() {
  
  ##loads dplyr for to manipulate the date
  library(dplyr)
  
  ##sets working directory to the same location as the data file
  setwd("~/RStudio/Working")
  
  ##loads file and reduces the data set to just the dates desired for this project
  data1<-read.table("household_power_consumption.txt", header=TRUE, sep=";",as.is=TRUE,na.strings="?")
  data1<-tbl_df(data1)
  data1<-filter(data1,grepl("^2/2/2007|^1/2/2007",Date))
  
  ##creates the combined date-time column and converts to Date
  data1<-mutate(data1,DateTime=paste(Date,Time, sep=" "))
  data1$DateTime<-strptime(data1$DateTime,"%d/%m/%Y %H:%M:%S")
  
  ##opens graphic device
  png(filename="plot1.png", width=480,height=480)
  
 ##plots graph
  hist(data1$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
 
 ##closes graphic device
 dev.off()

}


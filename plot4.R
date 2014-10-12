plot4 <- function() {
  
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
  png(filename="plot4.png", width=480,height=480)
  
  ##sets device to plot 4 graphs
  par(mfrow=c(2,2))
  
  ##graph1
  with(data1,plot(data1$DateTime,data1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
  ##graph2
  with(data1,plot(data1$DateTime,data1$Voltage,type="l",xlab="datetime",ylab="Voltage"))
  ##graph3
  with(data1,plot(data1$DateTime,data1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black"))
  points(data1$DateTime,data1$Sub_metering_2,type="l",col="red")
  points(data1$DateTime,data1$Sub_metering_3,type="l",col="blue")
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
  ##graph4
  with(data1,plot(data1$DateTime,data1$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
  
  ##closes graphic device
  dev.off()
  
}
datatable <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

dateRows <- datatable[["Date"]]=="1/2/2007" | datatable[["Date"]]=="2/2/2007"
plotdata <- datatable[dateRows,]

date_time<-as.POSIXct(strptime(paste(plotdata$Date, plotdata$Time), "%d/%m/%Y %H:%M:%S"))
plotdata<-cbind(plotdata,date_time)

png(file="plot3.png", width=480, height=480)
with(plotdata, {
  plot(date_time, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  points(date_time, Sub_metering_2, type="l", col="red")
  points(date_time, Sub_metering_3, type="l", col="blue")
  legend("topright", lty="solid", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
})
dev.off()
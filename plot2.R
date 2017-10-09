datatable <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

dateRows <- datatable[["Date"]]=="1/2/2007" | datatable[["Date"]]=="2/2/2007"
plotdata <- datatable[dateRows,]

date_time<-as.POSIXct(strptime(paste(plotdata$Date, plotdata$Time), "%d/%m/%Y %H:%M:%S"))
plotdata<-cbind(plotdata,date_time)

png(file="plot2.png", width=480, height=480)
plot(plotdata$date_time, plotdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
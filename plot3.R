#getting the data
t <- read.table("household_power_consumption.txt",header = TRUE,sep=";")

#subsetting the data
ta <- subset(t,Date=="1/2/2007" | Date =="2/2/2007")

# transforming the Date and Time columns to type Date and POSIXlt respectively
ta$Date <- as.Date(ta$Date, format="%d/%m/%Y")
ta$Time <- strptime(ta$Time, format="%H:%M:%S")
ta[1:1440,"Time"] <- format(ta[1:1440,"Time"],"2007-02-01 %H:%M:%S")
ta[1441:2880,"Time"] <- format(ta[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
#plotting
plot(ta$Time,as.numeric(as.character(ta$Sub_metering_1)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
lines(ta$Time,as.numeric(as.character(ta$Sub_metering_2)),col="red")
lines(ta$Time,as.numeric(as.character(ta$Sub_metering_3)),col="blue")

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

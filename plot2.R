#getting the data
t <- read.table("household_power_consumption.txt",header = TRUE,sep=";")

#subsetting the data
ta <- subset(t,Date=="1/2/2007" | Date =="2/2/2007")

# transforming the Date and Time columns to type Date and POSIXlt respectively
ta$Date <- as.Date(ta$Date, format="%d/%m/%Y")
ta$Time <- strptime(ta$Time, format="%H:%M:%S")
ta[1:1440,"Time"] <- format(ta[1:1440,"Time"],"2007-02-01 %H:%M:%S")
ta[1441:2880,"Time"] <- format(ta[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(ta$Time,as.numeric(as.character(ta$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

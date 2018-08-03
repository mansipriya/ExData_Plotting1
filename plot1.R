#getting the data
t <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#susetting the data
ta <- subset(t,Date=="1/2/2007" | Date =="2/2/2007")

png(filename = "plot1.png", width = 480, height = 480)

#calling the basic plot function
hist(as.numeric(as.character(ta$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

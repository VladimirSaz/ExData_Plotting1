#task 3 coursera
#read data and make a new subset for specified dates.
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

subsetByDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#parameters for plot 
plot3a <- as.numeric(subsetByDates$Sub_metering_1)
plot3b <- as.numeric(subsetByDates$Sub_metering_2)
plot3c <- as.numeric(subsetByDates$Sub_metering_3)
allDays <- strptime(paste(subsetByDates$Date, subsetByDates$Time), format="%d/%m/%Y %H:%M:%S")

# plot and create png
png("plot3.png", width = 480, height = 480, units = "px")
plot(allDays, plot3a, type="n", xlab="", ylab="Energy sub metering")
points(allDays, plot3a, type="l", col="black")
points(allDays, plot3b, type="l", col="red")
points(allDays, plot3c, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
#task 4 coursera
#read data and make a new subset for specified dates.
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

subsetByDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

# top left plot
plot1 <- as.numeric(subsetByDates$Global_active_power)
allDays <- strptime(paste(subsetByDates$Date, subsetByDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(allDays, plot1, xlab="", ylab="Global Active Power", type="l")

# top right plot
plot2 <- as.numeric(subsetByDates$Voltage)
allDays <- strptime(paste(subsetByDates$Date, subsetByDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(allDays, plot2, xlab="datetime", ylab="Voltage", type="l")

# bottom left plot
plot3a <- as.numeric(subsetByDates$Sub_metering_1)
plot3b <- as.numeric(subsetByDates$Sub_metering_2)
plot3c <- as.numeric(subsetByDates$Sub_metering_3)
allDays <- strptime(paste(subsetByDates$Date, subsetByDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(allDays, plot3a, type="n", xlab="", ylab="Energy sub metering")
points(allDays, plot3a, type="l", col="black")
points(allDays, plot3b, type="l", col="red")
points(allDays, plot3c, type="l", col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# bottom right plot
allDays <- as.numeric(subsetByDates$Global_reactive_power)
days <- strptime(paste(subsetByDates$Date, subsetByDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, allDays, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
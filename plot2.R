#task 2 coursera
#read data and make a new subset for specified dates.
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

subsetByDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
plot2 <- as.numeric(subsetByDates$Global_active_power)
allDays <- strptime(paste(subsetByDates$Date, subsetByDates$Time), format="%d/%m/%Y %H:%M:%S")

#make a plot and then save as png
plot(allDays, plot2, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
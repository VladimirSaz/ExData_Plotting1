#task 1 coursera
#read data and make a new subset for specified dates.
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

subsetByDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
plot1 <- as.numeric(subsetByDates$Global_active_power)

#make a histogram and then save as png
hist(plot1, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
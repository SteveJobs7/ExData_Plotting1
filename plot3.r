data <- read.table("household_power_consumption.txt", na.strings = c("?"), sep=";",header=TRUE)
# Subsetting by Date 
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

# String to POSIXct
data$wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
data<-na.omit(data)

#Plot 3
png(filename = "plot3.png", width = 480, height = 480, )
plot(data$wDays, data$Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")
lines(data$wDays, data$Sub_metering_2, type ="l", xlab="", col="red", ylab="Energy sub metering")
lines(data$wDays, data$Sub_metering_3, type ="l", xlab="", col="blue", ylab="Energy sub metering")
dev.off()
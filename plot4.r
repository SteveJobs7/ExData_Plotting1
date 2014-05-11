data <- read.table("household_power_consumption.txt", na.strings = c("?"), sep=";",header=TRUE)
# Subsetting by Date 
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
data$wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
data<-na.omit(data)

#Plot 4
png(filename = "plot4.png", width = 480, height = 480, )
par(mfrow = c(2,2))
plot(wDays, data$Global_active_power, type ="l", xlab="", ylab="Global Active Power")
plot(wDays, data$Voltage, type ="l", xlab="datetime", ylab="Voltage")
plot(wDays, data$Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")
lines(wDays, data$Sub_metering_2, type ="l", xlab="", col="red", ylab="Energy sub metering")
lines(wDays, data$Sub_metering_3, type ="l", xlab="", col="blue", ylab="Energy sub metering")
plot(wDays, data$Global_reactive_power, type ="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
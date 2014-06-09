data <- read.table("household_power_consumption.txt", na.strings = c("?"), sep=";",header=TRUE)
# Subsetting by Date 
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

# String to POSIXct
data$wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
data<-na.omit(data)

#Plot 2
png(filename = "plot2.png", width = 480, height = 480, )
plot(data$wDays, data$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
data <- read.table("household_power_consumption.txt", na.strings = c("?"), sep=";",header=TRUE)
# Subsetting by Date 
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

# String to POSIXct
data$wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
data<-na.omit(data)

# Plot 1
png(filename = "plot1.png", width = 480, height = 480, )
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
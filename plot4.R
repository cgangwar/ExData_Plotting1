#load data from current directory
classes <- c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
file <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes)

#clean up and subset
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")  
file$timetemp <- paste(file$Date, file$Time)  
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")  
set <- subset(file, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#plot
png( filename = "plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))
#1
with(set, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
#2
with(set, plot(Time, Voltage , type= "l", xlab = "datetime"))
#3
with (set, plot(Time, Sub_metering_1 , type = "l" , ylab = "Energy sub metering", xlab = "" ))
lines(set$Time, set$Sub_metering_2, col = "red")
lines(set$Time, set$Sub_metering_3, col = "blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
with(set, plot(Time, Global_reactive_power, type = "l", , xlab = "datetime"))

dev.off()

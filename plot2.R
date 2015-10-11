#load data
setwd("C:/dev/coursera/exploratory/week1/project1")
classes <- c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
file <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes)

#clean up and subset
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")  
file$timetemp <- paste(file$Date, file$Time)  
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")  
set <- subset(file, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#plot
png( filename = "plot2.png", width = 480, height = 480)
with(set, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()

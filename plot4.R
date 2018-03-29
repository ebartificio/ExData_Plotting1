library(data.table)
library(dplyr)

hhpower<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data within the date range.
hhpower_subset<-subset(hhpower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Format the year and hour in the dataset.
date_time <- strptime(paste(hhpower_subset$Date, hhpower_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert columns as numeric. This is necessary whenever using the plot function.
globalActivePower <- as.numeric(hhpower_subset$Global_active_power)
globalReactivePower <- as.numeric(hhpower_subset$Global_reactive_power)
Voltage <- as.numeric(hhpower_subset$Voltage)
Sub_metering_1 <- as.numeric(hhpower_subset$Sub_metering_1)
Sub_metering_2 <- as.numeric(hhpower_subset$Sub_metering_2)
Sub_metering_3 <- as.numeric(hhpower_subset$Sub_metering_3)

#Initiate the call to create a plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Plot the globalActivePower based on the subset data
plot(hhpower_subset$datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot the Voltage based on the subset data
plot(hhpower_subset$datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot the Energy sub-metering based on the subset data with three sub-meter.
plot(hhpower_subset$datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(hhpower_subset$datetime, Sub_metering_2, type="l", col="red")
lines(hhpower_subset$datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Plot the globalReactivePower based on the subset.
plot(hhpower_subset$datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


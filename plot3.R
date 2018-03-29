library(data.table)
library(dplyr)

hhpower<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hhpower_subset<-subset(hhpower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

date_time <- strptime(paste(hhpower_subset$Date, hhpower_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(hhpower_subset$Global_active_power)


hhpower_subset$Sub_metering_1 <- as.numeric(as.character(hhpower_subset$Sub_metering_1))
hhpower_subset$Sub_metering_2 <- as.numeric(as.character(hhpower_subset$Sub_metering_2))
hhpower_subset$Sub_metering_3 <- as.numeric(as.character(hhpower_subset$Sub_metering_3))


png("plot3.png", width=480, height=480)
plot(hhpower_subset$datetime, hhpower_subset$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(hhpower_subset$datetime, hhpower_subset$Sub_metering_2, type="l", col="red")
lines(hhpower_subset$datetime, hhpower_subset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()



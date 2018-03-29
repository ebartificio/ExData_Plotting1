library(data.table)
library(dplyr)

hhpower<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hhpower_subset<-subset(hhpower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

date_time <- strptime(paste(hhpower_subset$Date, hhpower_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(hhpower_subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time$hhpower_subset, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



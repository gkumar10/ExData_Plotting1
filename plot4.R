pc <- read.table("~/household_power_consumption.txt", header=FALSE, sep=";", nrows=2880, skip=66637, na.strings="?")
names(pc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
pc$DateTime <- strptime(paste(pc$Date, pc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
png(file="~/plot4.png", width=480, height=480)
par(mfcol = c(2,2))

#plot 1,1
plot(pc$DateTime, pc$Global_active_power, xlab="", ylab="Global Active Power", type="n")
lines(pc$DateTime, pc$Global_active_power)

#plot 1,2
plot(pc$DateTime, pc$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(pc$DateTime, pc$Sub_metering_1, xlab="Sub_metering_1", col="black")
lines(pc$DateTime, pc$Sub_metering_2, xlab="Sub_metering_2", col="red")
lines(pc$DateTime, pc$Sub_metering_3, xlab="Sub_metering_3", col="blue")
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

#plot 2,1
plot(pc$DateTime, pc$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(pc$DateTime, pc$Voltage)

#plot 2,2
plot(pc$DateTime, pc$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n")
lines(pc$DateTime, pc$Global_reactive_power)

dev.off()

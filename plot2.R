if (file.exists("household_power_consumption.txt")) {

  message("File available in working directory. Continue processing.")

} else {

    stop("Please copy raw data file to working directory")
}

pc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", nrows=2880, skip=66637, na.strings="?")

names(pc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

pc$DateTime <- strptime(paste(pc$Date, pc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480)

plot(pc$DateTime, pc$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")

lines(pc$DateTime, pc$Global_active_power)

dev.off()

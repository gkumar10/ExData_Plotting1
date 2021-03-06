if (file.exists("household_power_consumption.txt")) {

  message("File available in working directory. Continue processing.")

} else {

    stop("Please copy raw data file to working directory")
}

pc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", nrows=2880, skip=66637, na.strings="?")

names(pc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(file="plot1.png", width=480, height=480)

hist(pc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()

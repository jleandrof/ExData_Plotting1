## Plot 4

# Loading dataset into R.
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# Removing missing values
data <- na.omit(data)

# Converting date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Defining time period
time_period = data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]

par(mfrow = c(2,2))

# 1
plot((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Global_active_power), type="l", ylab = "Global Active Power", xlab = "")

# 2
plot((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Voltage), type="l", ylab = "Voltage", xlab = "datetime")

# 3
plot((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Sub_metering_1), type="l", ylab = "Energy sub metering", xlab = "")
lines((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Sub_metering_2), type="l", col="red")
lines((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Sub_metering_3), type="l", col="blue")
legend(x = "topright", cex = 0.8, lty=1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# 4
plot((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Global_reactive_power), type="l", ylab = "Global_reactive_power", xlab = "datetime")

# Save png
dev.copy(png, file = "plot4.png")
dev.off()
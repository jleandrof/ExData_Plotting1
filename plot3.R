## Plot 3


# Loading dataset into R.
data = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# Removing missing values
data <- na.omit(data)

# Converting date format
data$Date = as.Date(data$Date, format="%d/%m/%Y")

# Defining time period
time_period = data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]

#Ploting
plot((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Sub_metering_1), type="l", ylab = "Energy sub metering", xlab = "")
lines((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Sub_metering_2), type="l", col="red")
lines((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Sub_metering_3), type="l", col="blue")

legend(x = "topright", lwd=1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# Save png
dev.copy(png, file = "plot3.png")
dev.off()


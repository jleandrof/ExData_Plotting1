## Plot 2


# Loading dataset into R.
data = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# Removing missing values
data <- na.omit(data)

# Converting date format
data$Date = as.Date(data$Date, format="%d/%m/%Y")
as.Da
# Defining time period
time_period = data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]

#Ploting
plot((as.POSIXct(paste(time_period$Date, time_period$Time), "%d/%m/%Y %H:%M:%S")), as.numeric(time_period$Global_active_power), type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save png
dev.copy(png, file = "plot2.png")
dev.off()


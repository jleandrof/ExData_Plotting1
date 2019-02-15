## Plot 1


# Loading dataset into R.
data = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# Removing missing values
data <- na.omit(data)

# Converting date format
data$Date = as.Date(data$Date, format="%d/%m/%Y")

# Defining time period
time_period = data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]

# Ploting histogram
hist(time_period$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

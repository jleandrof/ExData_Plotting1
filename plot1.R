## Plot 1

# Downloading file and reading as a dataframe
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv(unz(temp, "household_power_consumption.txt"), sep=';', na.strings = "?")
unlink(temp)

# Removing missing values
data <- na.omit(data)

# Converting date format
data$Date = as.Date(data$Date, format="%d/%m/%Y")
as.Da
# Defining time period
time_period = data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]

# Ploting histogram
hist(time_period$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

# Save png
dev.copy(png, file = "plot1.png")
dev.off()

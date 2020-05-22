# Plot 1
WD <- getwd()
setwd(WD)

#Reading the data and subsetting just the first two days of February, 2007
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Changes date and time formats of the first two columns of the table
data1$Date <- as.Date(data1$Date, format = '%d/%m/%Y')
data1$Time <- strptime(paste(data1$Date, data1$Time, sep = " "), format = '%Y-%m-%d %H:%M:%S')

# Graphs the histogram of Global Active Power
hist(data1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Creates a PNG file with the graph
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()
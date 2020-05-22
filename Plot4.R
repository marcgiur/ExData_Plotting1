# Plot 4
WD <- getwd()
setwd(WD)

#Reading the data and subsetting just the first two days of February, 2007
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Changes date and time formats of the first two columns of the table
data1$Date <- as.Date(data1$Date, format = '%d/%m/%Y')
data1$Time <- strptime(paste(data1$Date, data1$Time, sep = " "), format = '%Y-%m-%d %H:%M:%S')

# Indicates two rows and two columns of graphs and sets the margins
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 0, 0))
# Creates the 4 graphs
with(data1, {
  # Plots Global Active Power Vs. date and time
  plot(Time, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
  # Plots Voltage Vs. date and time
  plot(Time, Voltage, type = "l",xlab = "datetime", ylab = "Voltage")
  # Plots the three variables Sub metering 1, 2 and 3 vs. date and time
  plot(Time, Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  legend("topright",lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = names(data1)[7:9])
  # Plots Global reactive power Vs. date and time
  plot(Time, Global_reactive_power, type = "l",xlab = "datetime", ylab = "Global_reactive_power")
  })

# Creates a PNG file with the graph
dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()
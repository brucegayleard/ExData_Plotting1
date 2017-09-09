# read the data file which is in a sub-directory of the wroking directory
allData <- read.table("./plot_data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# grab the data for the 2 dates that will be plotted
plotData <- allData[(allData$Date == "1/2/2007" | allData$Date == "2/2/2007"),]

# combine Data and Time into a new DataTime column
plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# set up the output png file
png(filename = "./plot_data/plot4.png", width = 480, height = 480)

# 4 plots 2 x 2
par(mfcol = c(2, 2))

# plot 4a
with(plotData, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

# plot 4b
with(plotData, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(plotData, lines(DateTime, Sub_metering_2, col = "red"))
with(plotData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

# plot 4c
with(plotData, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# plot 4d
with(plotData, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

# close the output file
dev.off()
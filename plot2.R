# read the data file which is in a sub-directory of the wroking directory
allData <- read.table("./plot_data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# grab the data for the 2 dates that will be plotted
plotData <- allData[(allData$Date == "1/2/2007" | allData$Date == "2/2/2007"),]

# combine Data and Time into a new DataTime column
plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# set up the output png file
png(filename = "./plot_data/plot2.png", width = 480, height = 480)

# create the plot
with(plotData, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# close the output file
dev.off()
# read the data file from the plot_data sub-directory of the working directory
allData <- read.table("./plot_data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# grab the data for the 2 days to be plotted
plotData <- allData[(allData$Date == "1/2/2007" | allData$Date == "2/2/2007"),]

# set up the output png file in the plot_data sub-directory of the working directory
png(filename = "./plot_data/plot1.png", width = 480, height = 480)

# create the plot
with(plotData, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))

# close the output file
dev.off()
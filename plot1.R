# Read the downloaded datafile 
powerConsumptionData <<- read.csv("../exdata-data-household_power_consumption/household_power_consumption.txt", 
						header=TRUE, sep=";", na.strings = "?",
						quote="", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Creating another data frame for ease of handling
Data1<<-powerConsumptionData

#subsetting for 2 days
Data2Days <<- Data1[(Data1[,1] == "1/2/2007") | (Data1[,1] == "2/2/2007"),]

# opening a device
png(filename="plot1.png", width=480, height=480)

#setting the plot format
par(mfrow = c(1,1))

hist(
  Data2Days$Global_active_power, 
  col="red", 
  main="Global Active Power", 
  xlab="Global Active Power (kilowatts)", 
  ylab="Frequency", 
  breaks=15)

dev.off()

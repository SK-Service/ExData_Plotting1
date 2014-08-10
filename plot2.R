# Read the downloaded datafile 
powerConsumptionData <<- read.csv("../exdata-data-household_power_consumption/household_power_consumption.txt", 
						header=TRUE, sep=";", na.strings = "?",
						quote="", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Creating another data frame for ease of handling
Data1<<-powerConsumptionData

#subsetting for 2 days
Data2Days <<- Data1[(Data1[,1] == "1/2/2007") | (Data1[,1] == "2/2/2007"),]

#Creating Datetime field
Data2Days$DateTime <- strptime(paste(Data2Days$Date, Data2Days$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# opening a device
png(filename="plot2.png", width=480, height=480)

#setting the plot format
par(mfrow = c(1,1))


plot(Data2Days$DateTime,Data2Days$Global_active_power,
	type="l",
      xlab="",
      ylab="Global Active Power (kilowatts)")


dev.off()
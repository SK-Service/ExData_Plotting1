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
png(filename="plot3.png", width=480, height=480)


#setting the plot format
par(mfrow = c(1,1))


plot(Data2Days$DateTime,Data2Days$Sub_metering_1,
	type="l",
      xlab="",
      ylab="Energy sub metering",
	col="black")

points(Data2Days$DateTime,Data2Days$Sub_metering_2,type="l",col="red")
points(Data2Days$DateTime,Data2Days$Sub_metering_3,type="l",col="blue")

legend("topright", 
	lty=1, 
      col = c("black","blue", "red"), 
      legend = c("sub_metering_1 ","sub_metering_2","sub_metering_3 "))

dev.off()
#Plot4.R
setwd("C:\\Laura\\DataScientist\\Exploratory Data Analysis\\Project_Assignment")
PowerConsDS <- read.table(text = grep("^[1,2]/2/2007", readLines(file("household_power_consumption.txt")), value = TRUE),
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
				 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
				 sep = ";", 
				 stringsAsFactors=F,
				 na.strings="?",
				 header = TRUE)	 
												   
## nrow(PowerConsDS) = 2879 

PC_date <- as.Date(PowerConsDS$Date, format="%d/%m/%Y")
PC_datetime <- paste(PowerConsDS$Date, PowerConsDS$Time)
datetime <- strptime(PC_datetime, "%d/%m/%Y %H:%M:%S")

#require(datasets)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(datetime, PowerConsDS$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, PowerConsDS$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, PowerConsDS$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, PowerConsDS$Sub_metering_2,  col="red")
lines(datetime, PowerConsDS$Sub_metering_3,  col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black", "red", "blue"),bty="o")

plot(datetime, PowerConsDS$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()




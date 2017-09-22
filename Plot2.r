#Plot2.R
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
global_active_power <- as.numeric(PowerConsDS$Global_active_power)

#require(datasets)
png("plot2.png", width=480, height=480)
plot(datetime,global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



#Plot1.R
setwd("C:\\Laura\\DataScientist\\Exploratory Data Analysis\\Project_Assignment")
PowerConsDS <- read.table(text = grep("^[1,2]/2/2007", readLines(file("household_power_consumption.txt")), value = TRUE),
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
				 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
				 sep = ";", 
				 stringsAsFactors=F,
				 na.strings="?",
				 header = TRUE)
 
												   
## nrow(PowerConsDS) = 2879 

PowerConsDS$Date <- as.Date(PowerConsDS$Date, format="%d/%m/%Y")
PowerConsDS$Time <- strptime(paste(PowerConsDS$Date, PowerConsDS$Time), "%Y-%m-%d %H:%M:%S")


require(datasets)
png("plot1.png", width=480, height=480)
hist(PowerConsDS$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frecuency")
dev.off()




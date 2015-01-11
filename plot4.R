## Jesse Singh, Ph.D
## Exploratory Analysis
## Project 1, plot 4

pcClasses <- c("character", "character", "numeric", "numeric", "numeric", 
        "numeric", "numeric", "numeric", "numeric")

powerConsumption <- read.table(file='household_power_consumption.txt', sep=';', 
                               header=TRUE, colClasses=pcClasses, 
                               na.strings = "?")

powerConsumption$DT <- as.POSIXlt(
        strptime(
                paste(powerConsumption$Date, " ", powerConsumption$Time), 
                format='%d/%m/%Y %H:%M:%S')
        )

powerConsumption.2days <- subset(powerConsumption, DT$year == 107 & DT$mon == 01
                                 & DT$mday >= 01 & DT$mday <= 02 )

png(filename='plot4.png', width=480, height=480, units = "px")

par(mfcol=c(2,2))

plot(powerConsumption.2days$DT, powerConsumption.2days$Global_active_power,
     type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(powerConsumption.2days$DT, powerConsumption.2days$Sub_metering_1,
     type="l", ylab = "Energy sub metering", xlab = "")
lines(powerConsumption.2days$DT, powerConsumption.2days$Sub_metering_2,
      type="l", col="red")
lines(powerConsumption.2days$DT, powerConsumption.2days$Sub_metering_3,
      type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"), bty="n")

plot(powerConsumption.2days$DT, powerConsumption.2days$Voltage,
     type="l", ylab = "Voltage", xlab = "datetime")

plot(powerConsumption.2days$DT, powerConsumption.2days$Global_reactive_power,
     type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()

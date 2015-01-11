## Jesse Singh, Ph.D
## Exploratory Analysis
## Project 1, plot 3

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

png(filename='plot3.png', width=480, height=480, units = "px")
plot(powerConsumption.2days$DT, powerConsumption.2days$Sub_metering_1,
     type="l", ylab = "Energy sub metering", xlab = "")
lines(powerConsumption.2days$DT, powerConsumption.2days$Sub_metering_2,
      type="l", col="red")
lines(powerConsumption.2days$DT, powerConsumption.2days$Sub_metering_3,
      type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()

## Jesse Singh, Ph.D
## Exploratory Analysis
## Project 1, plot 2

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

png(filename='plot2.png', width=480, height=480, units = "px")
plot(powerConsumption.2days$DT, powerConsumption.2days$Global_active_power,
     type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

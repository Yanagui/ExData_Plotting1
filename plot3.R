## read base
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep=";", na.strings = "?")

## subset period asked
dtset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

## Add column Date and Time
date_time <- paste(dtset$Date, dtset$Time, sep=" ")

## add this column to dataset
dtset <- cbind(dtset, date_time)

## convert to date
dtset$date_time <- strptime(dtset$date_time, "%d/%m/%Y %H:%M:%S")

## create png file - plot3
png("plot3.png")
plot(dtset$date_time, dtset$Sub_metering_1,
     type="l", xlab="", ylab="Energy sub metering")
lines(dtset$date_time, dtset$Sub_metering_2,type="l",col="red")
lines(dtset$date_time,dtset$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c("black","red","blue"))
dev.off()
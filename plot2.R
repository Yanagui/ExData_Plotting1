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

## create png file - plot2
png("plot2.png")
plot(dtset$date_time, dtset$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
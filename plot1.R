## read base
data <- read.table("household_power_consumption.txt", 
        header = TRUE, sep=";", na.strings = "?")

## subset period asked
dtset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

## create png file - plot1
png("plot1.png")
hist(dtset$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
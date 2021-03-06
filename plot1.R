Data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
Data$Date <- as.character(Data$Date)
subData <- subset(Data, Date == "2/2/2007" | Date == "1/2/2007")
library(lubridate)
subData$Date <- dmy(subData$Date)
subData$Time <- hms(subData$Time)
col <- c(3, 4,5,6,7,8)
subData[, col] <- lapply(col, function(x) as.numeric(as.character(subData[,x])))

hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
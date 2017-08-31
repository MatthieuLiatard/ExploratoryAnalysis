dataset= read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", comment.char = "")

SubdataSet = dataset[(as.Date(dataset$Date, "%d/%m/%Y") %in% as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y")),]

SubdataSet = transform(SubdataSet, DateTime = strptime(paste(SubdataSet$Date, SubdataSet$Time),"%d/%m/%Y %H:%M:%S"))

png("Plot1.png")

with(SubdataSet, hist(SubdataSet$Global_active_power, col="red", xlab = "Global Active Power kilowatts", main = "Global Active Power"))

dev.off()
dataset= read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", comment.char = "")

SubdataSet = dataset[(as.Date(dataset$Date, "%d/%m/%Y") %in% as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y")),]

SubdataSet = transform(SubdataSet, DateTime = strptime(paste(SubdataSet$Date, SubdataSet$Time),"%d/%m/%Y %H:%M:%S"))


png("Plot3.png")

plot(x=SubdataSet$DateTime,y=SubdataSet$Sub_metering_1, type="l", xlab="", ylab="Global Active Power kilowatts")

lines(SubdataSet$DateTime,SubdataSet$Sub_metering_2, col=2)

lines(SubdataSet$DateTime,SubdataSet$Sub_metering_3, col=4)

legend(x = "topright",legend = c("sub metering1","sub metering2","sub metering3"), col=c(1,2,4), lty = c(1,1,1))

dev.off()
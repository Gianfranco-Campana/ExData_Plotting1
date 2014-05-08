if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/household_power_consumption.zip")
unzip("./data/household_power_consumption.zip", exdir="./data")
hpc <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

nrow(hpc)
head(shpc)
names(shpc)

shpc <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

par(mfrow = c(2, 2))

gg <- strptime(paste(shpc$Date, shpc$Time), format='%d/%m/%Y %H:%M:%S')

Sys.setlocale(category = "LC_ALL", locale = "C")

png(filename = "./data/plot4.png", width = 480, height = 480, units = "px")

plot(gg, shpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(gg, shpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(gg, shpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", ylim=c(0, 38), col = "black", cex= 1, cex.lab=1, cex.axis=1)
lines(gg, shpc$Sub_metering_2, type="l", col = "red")
lines(gg, shpc$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1, bty="n")
plot(gg, shpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

names(shpc)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/household_power_consumption.zip")
unzip("./data/household_power_consumption.zip", exdir="./data")
hpc <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

nrow(hpc)
head(shpc)

shpc <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

gg <- strptime(paste(shpc$Date, shpc$Time), format='%d/%m/%Y %H:%M:%S')

Sys.setlocale(category = "LC_ALL", locale = "C")

png(filename = "./data/plot2.png", width = 480, height = 480, units = "px")

plot(gg, shpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

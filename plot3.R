# This file contains the download of the data and creating of Plot 3 as shown
# in assignment

# download file and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "Household_power_consumption.zip")
unzip("Household_power_consumption.zip")

# read in header and only relevant data and combine
header<-read.csv2("household_power_consumption.txt", nrows=1)
data<-read.table("household_power_consumption.txt", header=FALSE, na.strings="?", 
                 sep=";", skip=66637, nrows=2880)
names(data)<-names(header)

# convert date and time to date/time classes and add additional column datetime
data<-cbind(data, strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S"))
names(data)[10]<-"datetime"

# create plot 3 as png file
png(file="plot3.png")
plot(data$datetime, data$Sub_metering_1, pch="", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", pch=c("-","-","-"), col=c("black","red","blue"), seg.len=2, 
       lwd=2, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

# PLEASE NOTE: since I work with a german system time, in my graph "Do" for 
# "Donnerstag" (Thursday), "Fr" for "Freitag" (Friday) and "Sa" for "Samstag" 
# (Saturday) is shown
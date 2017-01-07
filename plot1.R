# This file contains the download of the data and creating of Plot 1 as shown
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

# create plot 1 as png file
png(file="plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

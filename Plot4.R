# Read the table into working directory
setwd("/Users/tianyuan/mooc_dstb/r")
table<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)
# Change the Date and Time variable class
testtable<-table

testtable$Date<-as.Date(testtable$Date,"%d/%m/%Y")
testtable$DT=paste(testtable$Date,testtable$Time)
testtable$DT<-strptime(testtable$DT,"%Y-%m-%d %H:%M:%S")
# Subset the needed data
subtable<-testtable[testtable$Date=="2007-02-01"|testtable$Date=="2007-02-02",]
# Use png to plot
png(filename = "Plot4.png",width = 480, height = 480)

# Specify the 2*2 chart layout
par(mfrow=c(2,2))
# Plot 1
with(subtable,plot(DT,Global_active_power,ylab= "Global Active Power (kilowatts)",type="l"))
# Plot 2
with(subtable,plot(DT,Voltage,type = "l",xlab = "datetime",ylab = "Voltage"))
# Plot 3
with(subtable,plot(DT,Sub_metering_1,ylab = "Energy sub merging",type = "n"))
with(subtable,lines(DT,Sub_metering_1))
with(subtable,lines(DT,Sub_metering_2,col="red"))
with(subtable,lines(DT,Sub_metering_3,col="blue"))
#Plot4
with(subtable,plot(DT,Global_reactive_power,type = "l"))
# Turn off the device
dev.off()

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
png(filename = "Plot3.png",width = 480, height = 480)
# Create a blank space
with(subtable,plot(DT,Sub_metering_1,ylab = "Energy sub merging",type = "n"))
# Add lines into the graph space
with(subtable,lines(DT,Sub_metering_1))
with(subtable,lines(DT,Sub_metering_2,col="red"))
with(subtable,lines(DT,Sub_metering_3,col="blue"))
# Turn off the device
dev.off()
# Read the table into working directory
setwd("/Users/tianyuan/mooc_dstb/r")
table<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)
# Change the Date and Time variable class
testtable<-table
# Subset the needed data
subtable<-testtable[testtable$Date=="2007-02-01"|testtable$Date=="2007-02-02",]
subtable$Date<-as.Date(subtable$Date,"%d/%m/%Y")
subtable$DT=paste(subtable$Date,subtable$Time)
subtable$DT<-strptime(subtable$DT,"%Y-%m-%d %H:%M:%S")

# Use png to plot line graphs
png(filename = "Plot2.png",width = 480, height = 480)
with(subtable,plot(DT,Global_active_power,ylab= "Global Active Power (kilowatts)",type="l"))
# Turn off the device
dev.off()
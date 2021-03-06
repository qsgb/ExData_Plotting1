## setwd to the file where the data saved
setwd("C:\\Users\\Jian\\Documents\\Study\\R book\\coursera R\\exdata_data_household_power_consumption")
## read all data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
## subset to 2007-02-01 and 2007-02-01
data2<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
## combine date and time, coect to systemic format
data2$Time<-paste(data2$Date,data2$Time)
data2$Time<-strptime(data2$Time,"%d/%m/%Y %H:%M:%S")
## set png device
png("plot2.png",width = 6,height= 6,units="in",res=600)
## draw the plot
op=par(mfrow=c(2,2))
plot(data2$Time,data2$Global_active_power,xlab="",main="",ylab="Global Active Power", type="l")
plot(data2$Time,data2$Voltage,xlab="datetime",main="",ylab="Voltage", type="l")
plot(data2$Time,data2$Sub_metering_1,xlab="",main="",ylab="Energy Sub metering ", type="n")
lines(data2$Time,data2$Sub_metering_1, col="black")
lines(data2$Time,data2$Sub_metering_2, col="red")
lines(data2$Time,data2$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(data2$Time,data2$Global_reactive_power,xlab="datetime",main="",ylab="Global_reactive_power", type="l")
## close the device
dev.off()

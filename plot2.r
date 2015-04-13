setwd("C:\\Users\\Jian\\Documents\\Study\\R book\\coursera R\\exdata_data_household_power_consumption")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data2<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data2$Time<-paste(data2$Date,data2$Time)
data2$Time<-strptime(data2$Time,"%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 6,height= 6,units="in",res=600)
plot(data2$Time,data2$Global_active_power,xlab="",main="",ylab="Global Active Power (kilowatts)", type="l")
dev.off()

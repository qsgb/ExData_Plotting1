##read all data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
##subset for 2007-02-01 and 2007-02-02
data2<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
##change to systemic time format
data2$Date<-as.Date(data2$Date,"%d/%m/%Y")
data2$Time<-strptime(data2$Time,"%H:%M:%S")
## draw hisgram for global active power
hist(data2$Global_active_power,xlab="Global Active Power (kilowatt)",main="Global Active Power",col="red")
dev.copy(png, file = "plot1.png")  ## copy to png

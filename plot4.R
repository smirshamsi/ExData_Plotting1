x<-read.csv("household_power_consumption.txt",sep=";") 
first<-subset(x,x$Date=="1/2/2007")
second<-subset(x,x$Date=="2/2/2007")
both_days<-rbind(first,second)
both_days$Date_Time<-paste (both_days$Date,":",both_days$Time,sep="")
both_days$Date_Time<- strptime(both_days$Date_Time,format='%d/%m/%Y:%H:%M:%S')


#making plot and saving into png file
png(filename="plot4.png",height=480,width=480)

par(mfrow=c(2,2))
###first plot
plot(both_days$Date_Time,as.numeric(as.character(both_days$Global_active_power)),type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(both_days$Date_Time,as.numeric(as.character(both_days$Global_active_power)),type="l")
### second plot
#mymin=min(as.numeric(both_days$Voltage))
plot(both_days$Date_Time,as.numeric(as.character(both_days$Voltage)),ylab="Voltage",xlab="datetime",type='n')
lines(both_days$Date_Time,as.numeric(as.character(both_days$Voltage)),type="l")
### third plot
plot(both_days$Date_Time,both_days$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",ylim=c(-2,38))
#axis(side=2,at=seq(0,35,10))
lines(both_days$Date_Time,as.numeric(as.character(both_days$Sub_metering_1)),type="l")
lines(both_days$Date_Time,as.numeric(as.character(both_days$Sub_metering_2)),type="l",col="red")
lines(both_days$Date_Time,both_days$Sub_metering_3,type="l",col="blue")
legend(1170360000,39.5,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1))
### fourth plot
plot(both_days$Date_Time,as.numeric(as.character(both_days$Global_reactive_power)),type="n",xlab="datetime",ylab="Global_reactive_power")
lines(both_days$Date_Time,as.numeric(as.character(both_days$Global_reactive_power)),type="l")




dev.off()

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
plot(both_days$Date_Time,as.numeric(both_days$Global_active_power)/500.0,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(both_days$Date_Time,as.numeric(both_days$Global_active_power)/500.0,type="l")
### second plot
mymin=min(as.numeric(both_days$Voltage))
plot(both_days$Date_Time,((as.numeric(both_days$Voltage)-mymin)/(90))+232,ylab="Voltage",xlab="datetime",type='n')
lines(both_days$Date_Time,((as.numeric(both_days$Voltage)-mymin)/(90))+232,type="l")
### third plot
plot(both_days$Date_Time,both_days$Sub_metering_1,type="n",yaxt='n',ylab="Energy sub metering",xlab="",ylim=c(-2,35))
axis(side=2,at=seq(0,35,10))
lines(both_days$Date_Time,as.numeric(both_days$Sub_metering_1)-2.0,type="l")
lines(both_days$Date_Time,(as.numeric(both_days$Sub_metering_2)/10.0) - 0.2,type="l",col="red")
lines(both_days$Date_Time,both_days$Sub_metering_3,type="l",col="blue")
legend(1170300000,35,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1),bty='n')

### fourth plot
plot(both_days$Date_Time,as.numeric(both_days$Global_reactive_power)/500.0,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(both_days$Date_Time,as.numeric(both_days$Global_reactive_power)/500.00,type="l")




dev.off()

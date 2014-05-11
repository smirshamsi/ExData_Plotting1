x<-read.csv("household_power_consumption.txt",sep=";")
first<-subset(x,x$Date=="1/2/2007")
second<-subset(x,x$Date=="2/2/2007")
both_days<-rbind(first,second)
#making plot and saving into png file
png(filename="plot2.png",height=480,width=480)

both_days$Date_Time<-paste (both_days$Date,":",both_days$Time,sep="")
both_days$Date_Time<- strptime(both_days$Date_Time,format='%d/%m/%Y:%H:%M:%S')
plot(both_days$Date_Time,as.numeric(both_days$Global_active_power)/500.0,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(both_days$Date_Time,as.numeric(both_days$Global_active_power)/500.0,type="l")
dev.off()

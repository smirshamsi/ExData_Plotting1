        #reading desired part of Data
        x<-read.csv("household_power_consumption.txt",sep=";")
        first<-subset(x,x$Date=="1/2/2007")
        second<-subset(x,x$Date=="2/2/2007")
        both_days<-rbind(first,second)

        #making plot and saving into png file
        png(filename="plot1.png",height=480,width=480)
        hist(as.numeric(as.character(both_days$Global_active_power)),xlab="Global Active Power (killowatts)",main="Global Active Power", col="red")
        dev.off()

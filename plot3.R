#####step1 get data#####
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#####step2 change date#####
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subdata<-subset(data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
subdata$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#####step3 draw plot#####
png("plot3.png", width = 480, height = 480)
dev.cur()
with(subdata, plot(x = datetime, y =Sub_metering_1，type = "l",col = "gray",xlab = "",ylab = "Global Active Power (kilowatts)"))
with(subdata, lines(datetime, Sub_metering_2,type = "l",col = "red"))
with(subdata, lines(datetime, Sub_metering_3,type = "l",col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("gray", "red", "blue"))
dev.off()
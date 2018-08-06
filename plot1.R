#####step1 get data#####
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#####step2 change date#####
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subdata<-subset(data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
subdata$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#####step3 draw plot#####
png("plot1.png", width = 480, height = 480)
with(subdata,hist(Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency"))
dev.off()
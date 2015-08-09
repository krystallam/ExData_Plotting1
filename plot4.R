
#####step1: read in dataset
mydata = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")  

######step2: subset to only data on 2007-02-01 and 2007-02-02
mydata_sub<-mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]

######step3: create datetime variable
datetime <- strptime(paste(mydata_sub$Date, mydata_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 



#######step4: create plot4
png(filename = "plot4.png",width = 480, height = 480,units = "px", bg = "transparent")

par(mfrow = c(2, 2)) ###set the final plot as 2X2 format

plot(datetime, mydata_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime,mydata_sub$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime,mydata_sub$Sub_metering_1,type = "n",ylab="Energy sub metering", xlab="", )
lines(datetime,mydata_sub$Sub_metering_1, col = "black")
lines(datetime,mydata_sub$Sub_metering_2, col = "red")
lines(datetime,mydata_sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty="n")

plot(datetime,mydata_sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
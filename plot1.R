
#####step1: read in dataset
mydata = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")  

######step2: subset to only data on 2007-02-01 and 2007-02-02
mydata_sub<-mydata[mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007",]

######step3: create datetime variable
datetime <- strptime(paste(mydata_sub$Date, mydata_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

######step4: create plot1

png(filename = "plot1.png",width = 480, height = 480,units = "px", bg = "transparent")

hist(mydata_sub$Global_active_power ,
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main="Global Active Power",
     col = "red")

dev.off() 
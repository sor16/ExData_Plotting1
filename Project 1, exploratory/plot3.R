data <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
#When subsetting,dates are chosen from the selected vector
selected=c("1/2/2007","2/2/2007") 
data1=data[data[,1] %in% selected,]
#Now the column 3 class is formatted and a new variable FullDate made
data1[,3]=as.numeric(as.character(data1[,3]))
data1$FullDate=as.POSIXct(paste(data1$Date,data1$Time),
                          format="%d/%m/%Y %H:%M:%S")

#Plot 3
#Energy sub metering plot includes three lines in black,red and blue  saved to a png file. 
#FullDate on the x-axis. Default xlab removed. Legend in topright
png("plot3.png",width=480,height=480)
with(data1,plot(FullDate,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering"))
with(data1,lines(FullDate,Sub_metering_2,col="red",type="l"))
with(data1,lines(FullDate,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       pch=NA, lwd=2, col=c("black", "red", "blue"))
dev.off()
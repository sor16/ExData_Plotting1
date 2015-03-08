data <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
#When subsetting,dates are chosen from the selected vector
selected=c("1/2/2007","2/2/2007") 
data1=data[data[,1] %in% selected,]
#Now the column 3 class is formatted and a new variable FullDate made
data1[,3]=as.numeric(as.character(data1[,3]))
data1$FullDate=as.POSIXct(paste(data1$Date,data1$Time),
                          format="%d/%m/%Y %H:%M:%S")

#Plot 2
##Global active power line plot in black saved to a png file. 
#FullDate on the x-axis. Default xlab removed
png("plot2.png",width=480,height=480)
with(data1,plot(FullDate,Global_active_power,type="l",xlab="",ylab="Global active power"))
dev.off()
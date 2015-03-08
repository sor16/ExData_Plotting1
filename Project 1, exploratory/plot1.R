data <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
#When subsetting,dates are chosen from the selected vector
selected=c("1/2/2007","2/2/2007") 
data1=data[data[,1] %in% selected,]
#Now the column 3 class is formatted and a new variable FullDate made
data1[,3]=as.numeric(as.character(data1[,3]))
data1$FullDate=as.POSIXct(paste(data1$Date,data1$Time),
                          format="%d/%m/%Y %H:%M:%S")

#Plot1
##Global active power histogram in red saved to a png file. FullDate is the x-axis
png("plot1.png",width=480,height=480)
with(data1,hist(Global_active_power,col="red",
                xlab="Global active power(kilowatts)",main="Global active power"))
dev.off()

household <- read.table(#location of your household consumption file
  ,sep = ";",na.strings = "?",header = T)
library(lubridate)
household1<-transform(household,Date= dmy(Date))
household1 <- subset(household1,Date == "2007-02-01"|Date == "2007-02-02")
library(dplyr)
household1<-mutate(household1,datetime = ymd_hms(paste(Date,Time)))

png(file = "Plot3.png",width = 480,height = 480)
with(household1,plot(datetime,Sub_metering_1,type= "l",ylab = "Energy sub metering"))
with(household1,points(datetime,Sub_metering_2,type = "l",col= "red"))
with(household1,points(datetime,Sub_metering_3,type="l",col= "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = 1)
dev.off()

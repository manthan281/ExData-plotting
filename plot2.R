household <- read.table(#location of your household consumption file
  ,sep = ";",na.strings = "?",header = T)
library(lubridate)
household1<-transform(household,Date= dmy(Date))
household1 <- subset(household1,Date == "2007-02-01"|Date == "2007-02-02")
library(dplyr)
household1<-mutate(household1,datetime = ymd_hms(paste(Date,Time)))

png(file = "Plot2.png",width = 480,height = 480)
with(household1,plot(datetime,Global_active_power,type= "l",ylab = "Global Active Power (kilowatts)"))
dev.off()

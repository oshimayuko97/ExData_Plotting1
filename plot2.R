data <- read.table('household_power_consumption.txt',sep=';',header=TRUE)
library(lubridate)
Sys.setlocale('LC_ALL','English_United States.1252')
d <- strptime(as.Date(data$Date,format='%d/%m/%Y'),format='%Y-%m-%d')
sdata1 <- data[grep('2007-02-01',d),]
sdata2 <- data[grep('2007-02-02',d),]
sdata <- rbind(sdata1,sdata2)
sdata$Date <- as.Date(sdata$Date,format='%d/%m/%Y')
GAP <- as.numeric(as.character(sdata$Global_active_power))
dt <- paste(as.character(sdata$Date),as.character(sdata$Time),sep=' ')
dt1 <- as.POSIXlt(dt, format='%Y-%m-%d %H:%M:%S')
png(filename='plot2.PNG',width=480,height=480,units='px')
plot(dt1,GAP,type='l',xlab=' ',ylab='Global Active Power(kilowatts)')
dev.off()

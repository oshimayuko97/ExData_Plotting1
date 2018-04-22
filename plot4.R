data <- read.table('household_power_consumption.txt',sep=';',header=TRUE)
library(lubridate)
Sys.setlocale('LC_ALL','English_United States.1252')
d <- strptime(as.Date(data$Date,format='%d/%m/%Y'),format='%Y-%m-%d')
sdata1 <- data[grep('2007-02-01',d),]
sdata2 <- data[grep('2007-02-02',d),]
sdata <- rbind(sdata1,sdata2)
sdata$Date <- as.Date(sdata$Date,format='%d/%m/%Y')
dt <- paste(as.character(sdata$Date),as.character(sdata$Time),sep=' ')
dt1 <- as.POSIXlt(dt, format='%Y-%m-%d %H:%M:%S')
png(filename='plot4.PNG',width=480,height=480,units='px')
par(mfrow=c(2,2))

# plot 1
GAP <- as.numeric(as.character(sdata$Global_active_power))
plot(dt1,GAP,ylab='Global Active Power(kilowatts)',type='l')

# plot 2
Voltage <- as.numeric(as.character(sdata$Voltage))
plot(dt1,Voltage,ylab='Global Active Power(kilowatts)',type='l')

# plot 3
Sub_metering_1<- as.numeric(as.character(sdata$Sub_metering_1))
Sub_metering_2<- as.numeric(as.character(sdata$Sub_metering_2))
Sub_metering_3<- as.numeric(as.character(sdata$Sub_metering_3))
plot(dt1,Sub_metering_1,type='l',xlab=' ',ylab='Energy sub metering')
lines(dt1,Sub_metering_2,col='RED')
lines(dt1,Sub_metering_3,col='BLUE')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lwd=1,col=c('BLACK','RED','BLUE'))

# plot 4
GRP <- as.numeric(as.character(sdata$Global_reactive_power))
plot(dt1,GRP,ylab='Global_reactive_power',type='l')

dev.off()
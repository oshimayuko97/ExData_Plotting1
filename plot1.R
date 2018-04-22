data <- read.table('household_power_consumption.txt',sep=';',header=TRUE)
d <- strptime(as.Date(data$Date,format='%d/%m/%Y'),format='%Y-%m-%d')
sdata1 <- data[grep('2007-02-01',d),]
sdata2 <- data[grep('2007-02-02',d),]
sdata <- rbind(sdata1,sdata2)
GAP <- as.numeric(as.character(sdata$Global_active_power))
png(filename='plot1.PNG',width=480,height=480,units='px')
hist(GAP,breaks=16,freq=TRUE,col='RED',main='Global Active Power',
     xlab='Global Active Power(kilowatts)')
dev.off()
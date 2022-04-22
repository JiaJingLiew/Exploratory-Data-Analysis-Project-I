download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = './hw1_data.zip', method = 'curl', quiet = T)
setwd("~/Course2 Assignment 4(1.)")
a<-read.table('household_power_consumption.txt', header = T, stringsAsFactors = F,na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880)
head(a,10)
tail(a,10)
colnames(a) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage','GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')
a$DateTime<-strptime(paste(a$Date, a$Time), '%d/%m/%Y %H:%M:%S')
###plot01
hist(a$GlobalActivePower, col = 'red', main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)')

###plot2
plot(x = a$DateTime, y = a$GlobalActivePower, type = 'l', xlab = NA, ylab = 'Global Active Power (kilowatts)')

###plot03
plot(x = a$DateTime, y = a$SubMetering1, type = 'l',xlab = NA, ylab = 'Energy sub metering')
lines(x = a$DateTime, y = a$SubMetering2, col = 'red')
lines(x = a$DateTime, y = a$SubMetering3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col = c('black', 'red', 'blue'),lwd = 1)

###plot04
par(mfrow = c(2, 2)) 
plot(x = a$DateTime, y = a$GlobalActivePower, type = 'l', xlab = NA, ylab = 'Global Active Power (kilowatts)')
plot(x = a$DateTime, y = a$Voltage, type = 'l', xlab = NA, ylab = 'Voltages')
plot(x = a$DateTime, y = a$SubMetering1, type = 'l',xlab = NA, ylab = 'Energy sub metering')
lines(x = a$DateTime, y = a$SubMetering2, col = 'red')
lines(x = a$DateTime, y = a$SubMetering3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col = c('black', 'red', 'blue'),lwd = 1)
plot(x = a$DateTime, y = a$GlobalActivePower, type = 'l', xlab = 'datetime', ylab = 'Global Active Power (kilowatts)')
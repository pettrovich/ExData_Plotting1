# load the energy data
source("data_load.R")

# open the png device to plot plot4.png
png(filename="plot4.png",width=480,height=480)

# set the graphicd device to show a 2x2 grid
par(mfcol=c(2,2))

# plot the first graph
plot(energy$Date+energy$Time,energy$Global_active_power,
     type="l",xlab="",ylab="Global Active Power (kilowatts)")

# plot the second graph
# plot the graph of Sub metering 1
plot(energy$Date+energy$Time,energy$Sub_metering_1,
     type="l",xlab="",ylab="Energy sub metering")
# add sub metering 2 in red
lines(energy$Date+energy$Time,energy$Sub_metering_2,col="red")
# add sub metering 2 in blue
lines(energy$Date+energy$Time,energy$Sub_metering_3,col="blue")
# add the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n")

# plot the third graph
plot(energy$Date+energy$Time,energy$Voltage,
     type="l",xlab="datetime",ylab="Voltage")

# plot the fourth graph
plot(energy$Date+energy$Time,energy$Global_reactive_power,
     type="l",xlab="datetime",ylab="Global_reactive_power")

#close the png device
dev.off()
# load the energy data
source("data_load.R")

# open the png device to plot plot3.png
png(filename="plot3.png",width=480,height=480)

# plot the graph of Sub metering 1
plot(energy$Date+energy$Time,energy$Sub_metering_1,
     type="l",xlab="",ylab="Energy sub metering")

# add sub metering 2 in red
lines(energy$Date+energy$Time,energy$Sub_metering_2,col="red")

# add sub metering 2 in blue
lines(energy$Date+energy$Time,energy$Sub_metering_3,col="blue")

# add the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)

#close the png device
dev.off()
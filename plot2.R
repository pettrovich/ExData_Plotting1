# load the energy data
source("data_load.R")

# open the png device to plot plot2.png
png(filename="plot2.png",width=480,height=480)

# plot the graph
plot(energy$Date+energy$Time,energy$Global_active_power,
     type="l",xlab="",ylab="Global Active Power (kilowatts)")

#close the png device
dev.off()
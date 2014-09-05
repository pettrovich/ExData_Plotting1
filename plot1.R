# load the energy data
source("data_load.R")

# open the png device to plot plot1.png
png(filename="plot1.png",width=480,height=480)

# plot the histogram
hist(energy$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")

#close the png device
dev.off()
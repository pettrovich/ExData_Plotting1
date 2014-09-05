
# loads the lubridate library to handle Dates and Times
library(lubridate)

datafile <- ("household_power_consumption.txt")

# checks if the data has already been downloaded and unzipped
if (!file.exists(datafile)) {
    zipfile <- ("energy_data.zip")
    # if not, checks if the zipped data has already been downloaded
    if (!file.exists(zipfile)) {
        # if not, downloads the zipfile
        fileURL <- paste0("http://d396qusza40orc.cloudfront.net/",
                    "exdata%2Fdata%2Fhousehold_power_consumption.zip")
        download.file(fileURL,zipfile)
        # unzips the zipfile
        unzip(zipfile)
        # and deletes the zipfile
        unlink(zipfile)
    }
}

# loads the energy data
energy <- read.table(datafile,sep=";",header=TRUE,
                     na.strings="?",stringsAsFactors=FALSE)

# subsets the data to the only two dates needed
energy <- energy[grep("^(1|2)/2/2007",energy$Date),]

# rewrites the file with the subsetted data to avoid reloading the whole set
write.table(energy,datafile,row.names=FALSE,sep=";")

# changes the system locale to get the day names in english
Sys.setlocale("LC_TIME","C")

# changes the classes of the Date and Time columns using lubridate
energy$Date <- dmy(energy$Date)
energy$Time <- hms(energy$Time)
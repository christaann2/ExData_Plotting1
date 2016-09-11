##downloads zip file if the zip file does not exist in your directory and then unzips

if(!file.exists("/data.zip"))
  url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")

##takes the raw data file, 
##extracts the Date and Time columns and places them in in one column,
##selects only the dates Feb 1 - Feb 2, 2007 and saves in Final_Date

raw_data <- read.table("household_power_consumption.txt", 
                       header = TRUE, sep= ";")
Date_Time <- paste(raw_data$Date, raw_data$Time)
raw_data$Date_Time <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")
begindate <- which(raw_data$Date_Time == strptime("2007-02-01", "%Y-%m-%d"))
enddate <- which(raw_data$Date_Time == strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
Final_data <- raw_data[begindate:enddate,]

##plots a histogram of the Global active power column in our Final_data

hist(as.numeric(as.character(Final_data$Global_active_power)),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

##recreates the histogram from above and sends to "plot1" png file

png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(Final_data$Global_active_power)),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
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

##plots the energy submetering 1, 2, & 3 on one plot by day

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Sub_metering_1)), 
     type='l', 
     xlab = "", 
     ylab = "Energy sub metering")
lines(Final_data$Date_Time, as.numeric(as.character(Final_data$Sub_metering_2)),
      type = 'l',
      col = 'red')
lines(Final_data$Date_Time, Final_data$Sub_metering_3, type = 'l',
      col = "blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"))

##recreates the same plot and sends to "plot3" png file

png("plot3.png", width=480, height=480)
plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Sub_metering_1)), 
     type='l', 
     xlab = "", 
     ylab = "Energy sub metering")
lines(Final_data$Date_Time, as.numeric(as.character(Final_data$Sub_metering_2)),
      type = 'l',
      col = 'red')
lines(Final_data$Date_Time, Final_data$Sub_metering_3, type = 'l',
      col = "blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"))

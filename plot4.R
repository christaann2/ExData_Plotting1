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

## makes 4 line type plots in 2 rows, 2 per row of Global active power by day, Voltage by day,
## Energy sub metering by day and Global Reactive Power by day

par(mfcol = c(2,2))

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Global_active_power)), xlab = "", ylab = "Global Active Power", type = 'l')

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Sub_metering_1)), xlab = "", ylab ="Energy sub metering", type = 'l')
lines(Final_data$Date_Time, as.numeric(as.character(Final_data$Sub_metering_2)), col = 'red', type = 'l')
lines(Final_data$Date_Time, Final_data$Sub_metering_3, col = "blue", type = 'l')
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Voltage)), xlab = "Date_Time", ylab = "Voltage", type = 'l')

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Global_reactive_power)), xlab = "Date_Time", ylab = "Global_reactive_power", type = 'l')

##recreates the same 4 plots in one and sends to png "plot4" per width parameters

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Global_active_power)), xlab = "", ylab = "Global Active Power", type = 'l')

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Sub_metering_1)), xlab = "", ylab ="Energy sub metering", type = 'l')
lines(Final_data$Date_Time, as.numeric(as.character(Final_data$Sub_metering_2)), col = 'red', type = 'l')
lines(Final_data$Date_Time, Final_data$Sub_metering_3, col = "blue", type = 'l')
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Voltage)), xlab = "Date_Time", ylab = "Voltage", type = 'l')

plot(Final_data$Date_Time, as.numeric(as.character(Final_data$Global_reactive_power)), xlab = "Date_Time", ylab = "Global_reactive_power", type = 'l' )
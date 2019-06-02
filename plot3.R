run <- function() {
  # Creates data frame storing data from 1 Feb 2007 to 3 Feb 2007
  data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
  dataNames <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 1)
  names(data) <- names(dataNames)
  
  # Plots graph
  library(dplyr)
  library(lubridate)
  png(filename = "ExData_1/plot3.png")
  data$Date <- dmy(data$Date)
  data2 <- mutate(data, Date_Time = paste(data$Date, data$Time))
  data2$Date_Time <- ymd_hms(data2$Date_Time)
  plot(data2$Date_Time, data2$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "")
  lines(data2$Date_Time, data2$Sub_metering_2, col = "red")
  lines(data2$Date_Time, data2$Sub_metering_3, col = "blue")
  title(main = "Energy sub-metering")
  legend("topright", legend = c(names(data2)[7], names(data2)[8], names(data2)[9]), col = c("black", "red", "blue"), lty = 1)
  dev.off()
}
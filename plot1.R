run <- function() {
  # Creates data frame storing data from 1 Feb 2007 to 3 Feb 2007
  data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
  dataNames <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 1)
  names(data) <- names(dataNames)
  
  # Plots graph
  png(filename = "ExData_1/plot1.png")
  hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
  dev.off()
}
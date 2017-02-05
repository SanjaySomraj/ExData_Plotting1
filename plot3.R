# Set the working directory
setwd("D:/Sanjay S/KM/DataScienceProjects/EDA/ExData_Plotting1")

# Extract data from household power consumption text file
HPC_CompleteData <- read.csv("household_power_consumption.txt", 
                             header=TRUE, sep=';', na.strings="?", 
                             check.names=FALSE, stringsAsFactors=FALSE)

# Subset the the data for the 2 days :: 1 Feb 2007 and 02 Feb 2007
SubsetData <- subset(HPC_CompleteData, Date %in% c("1/2/2007","2/2/2007"))

# Remove the extracted data
rm("HPC_CompleteData")

# Set Date values of character to POSIXlt class and concatenate Time values
datetime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

# Set Graphic device for the plot to PNG
png("plot3.png", width=480, height=480)

# Setup the plot
with(SubsetData,
     plot(datetime, Sub_metering_1, 
          type="l", ylab="Energy Sub metering", xlab="")
     )

# Setup the Legend and line colors for the plot
lines(datetime, SubsetData$Sub_metering_2, type="l", col="red")
lines(datetime, SubsetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Close the graphics device
dev.off()

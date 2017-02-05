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

# Set Date values of character to POSIXlt class
SubsetData$Date <- strptime(SubsetData$Date,"%d/%m/%y")

# Set Graphic device for the plot to PNG
png("plot1.png", width=480, height=480)

# Prepare a Histogram and set the Main title, labels for X-axis and y-axis
hist(SubsetData$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")

# Close the Grapics device
dev.off()
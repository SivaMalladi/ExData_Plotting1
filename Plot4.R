#plot4.R
# Load the input put file in csv format with relevant settings
# Subset the input file for the dates 1/2/2007 and 2/2/2007
# Extract all the columns except Global_intensity and  coerce them as needed 
# Concatinate  and format Date and Time vairables  into one variable DateTime
# Define 4 panels(2 rows, 2 cols) using par(mfrow()) function
# Open PNG graphics device with 480x480 pixel size
# Plot the line chart DateTime and Submetering1 variable with appropriate label settings
# Using lines function plot line charts for submetering2 and submetering3 against DateTime variable

hhpc<-read.csv("./data/household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE,dec = ".")
hhpc$Date <- as.Date(hhpc$Date, format = "%d/%m/%Y")
hhpcsample<-subset(hhpc,Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02"),select = -Global_intensity)

hhpcsample$DateTime <- strptime(paste(as.character(hhpcsample$Date),hhpcsample$Time,sep=""), format = "%Y-%m-%d %H:%M:%S")
hhpcsample$Global_active_power <-as.numeric(hhpcsample$Global_active_power)
hhpcsample$Global_reactive_power <-as.numeric(hhpcsample$Global_reactive_power)
hhpcsample$Voltage <- as.numeric(hhpcsample$Voltage)
hhpcsample$Sub_metering_1 <- as.numeric(hhpcsample$Sub_metering_1)
hhpcsample$Sub_metering_2 <- as.numeric(hhpcsample$Sub_metering_2)
hhpcsample$Sub_metering_3 <- as.numeric(hhpcsample$Sub_metering_3)

png("Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(hhpcsample$DateTime, hhpcsample$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(hhpcsample$DateTime, hhpcsample$Voltage, type = "l", xlab = "DateTime", ylab = "Voltage")

plot(hhpcsample$DateTime,hhpcsample$Sub_metering_1,  type = "l", col = "black", xlab="", ylab = "Energy sub metering")
lines(hhpcsample$DateTime,hhpcsample$Sub_metering_2, type = "l", col = "red")
lines(hhpcsample$DateTime,hhpcsample$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2, col = c("black","red","blue"),bty = "n")

plot(hhpcsample$DateTime, hhpcsample$Global_reactive_power, type = "l", xlab = "DateTime", ylab = "Global reactive power")

dev.off()

# --- End of Script ---
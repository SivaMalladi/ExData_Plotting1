#plot3.R
# Load the input put file in csv format with relevant settings
# Subset the input file for the dates 1/2/2007 and 2/2/2007
# Extract only the required columns i.e Global_active_power, Date,Time, Sub_metering_1, _2,_3 and coerce them as needed 
# Concatinate  and format Date and Time vairables  into one variable DateTime
# Open PNG graphics device with 480x480 pixel size
# Plot the line chart DateTime and Submetering1 variable with appropriate label settings
# Using lines function plot line charts for submetering2 and submetering3 against DateTime variable

hhpc<-read.csv("./data/household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE,dec = ".")
hhpc$Date <- as.Date(hhpc$Date, format = "%d/%m/%Y")
hhpcsample<-subset(hhpc,Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02"),select = c(Global_active_power,Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3))

hhpcsample$DateTime <- strptime(paste(as.character(hhpcsample$Date),hhpcsample$Time,sep=""), format = "%Y-%m-%d %H:%M:%S")
hhpcsample$Global_active_power <-as.numeric(hhpcsample$Global_active_power)
hhpcsample$Sub_metering_1 <- as.numeric(hhpcsample$Sub_metering_1)
hhpcsample$Sub_metering_2 <- as.numeric(hhpcsample$Sub_metering_2)
hhpcsample$Sub_metering_3 <- as.numeric(hhpcsample$Sub_metering_3)

png("plot3.png", width = 400, height = 400)
plot(hhpcsample$DateTime,hhpcsample$Sub_metering_1,  type = "l", col = "black", xlab="", ylab = "Energy sub metering")
lines(hhpcsample$DateTime,hhpcsample$Sub_metering_2, type = "l", col = "red")
lines(hhpcsample$DateTime,hhpcsample$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2, col = c("black","red","blue"))
dev.off()

# --- End of Script ---
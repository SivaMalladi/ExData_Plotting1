#plot2.R
# Load the input put file in csv format with relevant settings
# Subset the input file for the dates 1/2/2007 and 2/2/2007
# Extract only the required columns i.e Global_active_power, Date and Time 
# Concatinate  and format Date and Time vairables  into one variable DateTime
# Open PNG graphics device with 480x480 pixel size
# Plot line graph for DateTime and Global Active Power variable with appropriate color and label settings

hhpc<-read.csv("./data/household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE,dec = ".")
hhpc$Date <- as.Date(hhpc$Date, format = "%d/%m/%Y")
hhpcsample<-subset(hhpc,Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02"),select = c(Global_active_power,Date,Time))

hhpcsample$DateTime <- strptime(paste(as.character(hhpcsample$Date),hhpcsample$Time,sep=""), format = "%Y-%m-%d %H:%M:%S")
hhpcsample$Global_active_power <-as.numeric(hhpcsample$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(hhpcsample$DateTime,hhpcsample$Global_active_power, type = "l", xlab="", ylab = "Global Acive Power(Kilowatts)")

dev.off()

# --- End of Script ---

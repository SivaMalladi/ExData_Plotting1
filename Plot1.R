#plot1.R
# Load the input put file in csv format with relevant settings
# Subset the input file for the dates 1/2/2007 and 2/2/2007
# Extract only the required columns i.e Global_active_power and coerce it to numeric
# Open PNG graphics device with 480x480 pixel size
# Plot the histogram with appropriate color and label settings

hhpc<-read.csv("./data/household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE,dec = ".")
hhpc$Date <- as.Date(hhpc$Date, format = "%d/%m/%Y")
hhpcsample<-subset(hhpc,Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02"),select = c(Global_active_power))

hhpcsample$Global_active_power <-as.numeric(hhpcsample$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(hhpcsample$Global_active_power,col="red", main= "Global Acive Power",xlab = "Global Acive Power(Kilowatts)")

dev.off()

# --- End of Script ---

setwd(".\\coursera\\expdata\\week1")

# fetching 5 rows to extract col classes
df = read.table("household_power_consumption.txt", header=TRUE, sep = ";", nrows = 5, na.strings="?", stringsAsFactors=FALSE)

# fetching the classes to use in colClasses for faster read.
classes <- sapply(df, class)
df = read.table("household_power_consumption.txt", header=TRUE, sep = ";", nrows = 2075300, colClasses = classes, na.strings="?", stringsAsFactors=FALSE)

# convert Date column from "character" to "Date" type
df <- transform(df, Date = as.Date(Date, format="%d/%m/%Y"))

# subset the data
df <- subset(df, df$Date >= '2007-02-01' & df$Date <= '2007-02-02')

df['datetime'] <- as.POSIXct(paste(df$Date,df$Time), format="%Y-%m-%d %H:%M:%S", usetz=FALSE)

# plotting plot 3
png("plot3.png", width=480, height=480, bg="transparent")
with (df, plot(datetime, Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", col="black"))
with (df, lines(datetime, Sub_metering_2, col="red"))
with (df, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

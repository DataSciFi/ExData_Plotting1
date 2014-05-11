setwd("PATH_TO_DATA_SOURCE")

# Fetch the data
df <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, dec=".", na.strings="?")
summary(df)

# With the given conditions it is eaiser to subset two exact days subset before datetime processing
dfs <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
summary(dfs)

# Add DateTime value
dfs$datetime <- strptime(paste(dfs$Date, dfs$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Draw plot 3
png(filename="plot3.png")
par(mfrow=c(1,1))
with(dfs, plot(datetime, Sub_metering_1, pch="", type="l", ylab="Energy sub metering"), xlab="")
with(dfs, lines(datetime, Sub_metering_2, col="red"))
with(dfs, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lwd=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

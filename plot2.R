setwd("PATH_TO_DATA_SOURCE")

# Fetch the data
df <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, dec=".", na.strings="?")
summary(df)

# With the given conditions it is eaiser to subset two exact days subset before datetime processing
dfs <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
summary(dfs)

# Add DateTime value
dfs$datetime <- strptime(paste(dfs$Date, dfs$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Draw plot 2
png(filename="plot2.png")
par(mfrow=c(1,1), cex.main=0.9, cex.lab=0.85, cex.axis=0.85)
with(dfs, plot(datetime, Global_active_power, pch="", type="l", ylab="Global Active Power (kilowatts)"), xlab="", cex.main=0.9, cex.lab=0.8, cex.axis=0.8)
dev.off()

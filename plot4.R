# Plot 4: histogram of global active power
#-----------------------------------------------------------

imgfile <- "plot4.png"

source("getdata.R")
df <- get.data()

# Open PNG device
png(imgfile, width=480, height=480)

# Plot commands
par(mfrow=c(2,2))

# Subplot 1: histogram
plot(
  df$dt, df$Global_active_power,
  type="l", xlab="", ylab="Global Active Power"
)

# Subplot 2: voltage timeline
plot(
  df$dt, df$Voltage,
  type="l", xlab="datetime", ylab="Voltage"
)

# Subplot 3: sub-meterings timeline
plot(
  df$dt, df$Sub_metering_1,
  type="l", col="black", xlab="", ylab="Energy sub metering"
)
points(
  df$dt, df$Sub_metering_2,
  type="l", col="red"
)
points(
  df$dt, df$Sub_metering_3,
  type="l", col="blue"
)
legend(
  "topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  col=c("black","red","blue"), lty=1, bty="n", cex=0.95
)

# Subplot 4: global reactive power timeline
with(df,
  plot(
    dt, Global_reactive_power,
    type="l", xlab="datetime"
  )
)

# Close PNG device
dev.off()

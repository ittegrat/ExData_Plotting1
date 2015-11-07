# Plot 3: sub-meterings timeline
#-----------------------------------------------------------

write2png <- TRUE
imgfile <- "plot3.png"

source("getdata.R")
df <- get.data()

# Open PNG device
if (write2png) png(imgfile, width=480, height=480)

# Plot commands
plot(
  df$dt, df$Sub_metering_1,
  type="l",
  col="black",
  xlab="",
  ylab="Energy sub metering"
)

points(
  df$dt, df$Sub_metering_2,
  type="l",
  col="red"
)

points(
  df$dt, df$Sub_metering_3,
  type="l",
  col="blue"
)

legend(
  "topright",
  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  col=c("black","red","blue"),
  lty=1
)

# Close PNG device
if (write2png) dev.off()

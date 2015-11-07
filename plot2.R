# Plot 2: global active power timeline
#-----------------------------------------------------------

imgfile <- "plot2.png"

source("getdata.R")
df <- get.data()

# Open PNG device
png(imgfile, width=480, height=480)

plot(
  df$dt, df$Global_active_power,
  type="l",
  xlab="",
  ylab="Global Active Power (kilowatts)"
)

# Close PNG device
dev.off()

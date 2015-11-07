# Plot 2: global active power timeline
#-----------------------------------------------------------

write2png <- TRUE
imgfile <- "plot2.png"

source("getdata.R")
df <- get.data()

# Open PNG device
if (write2png) png(imgfile, width=480, height=480)

plot(
  df$dt, df$Global_active_power,
  type="l",
  xlab="",
  ylab="Global Active Power (kilowatts)"
)

# Close PNG device
if (write2png) dev.off()

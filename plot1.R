# Plot 1: histogram of global active power
#-----------------------------------------------------------

write2png <- TRUE
imgfile <- "plot1.png"

source("getdata.R")
df <- get.data()

# Open PNG device
if (write2png) png(imgfile, width=480, height=480)

hist(
  df$Global_active_power,
  col="red",
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)"
)

# Close PNG device
if (write2png) dev.off()

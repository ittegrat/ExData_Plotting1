# Plot 1: histogram of global active power
#-----------------------------------------------------------

imgfile <- "plot1.png"

source("getdata.R")
df <- get.data()

# Open PNG device
png(imgfile, width=480, height=480)

hist(
  df$Global_active_power,
  col="red",
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)"
)

# Close PNG device
dev.off()

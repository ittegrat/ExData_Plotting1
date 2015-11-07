# Download and prepare raw data
#-----------------------------------------------------------

get.data <- function(fastload=TRUE) {
  # Set variables
  dataURL <- "https://d396qusza40orc.cloudfront.net/exdata/data"
  dataZip <- "household_power_consumption.zip"
  dataCSV <- "household_power_consumption.txt"

  colNames = c(
    "Date", "Time", "Global_active_power","Global_reactive_power","Voltage",
    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"
  )
  colTypes = c(
    "character", "character", "numeric", "numeric", "numeric",
    "numeric", "numeric", "numeric", "numeric"
  )

  # If necessary, download data file in binary mode
  if (!file.exists(dataZip))
    download.file(paste0(dataURL, "/", dataZip), destfile=dataZip, mode="wb")

  # If necessary, extract data
  if (!file.exists(dataCSV))
    unzip(dataZip)

  df <- data.frame()
  if (fastload) {

    # Load only relevant observations
    skip=66637
    keep=2880
    df <- read.table(
      dataCSV, skip=skip, nrows=keep,
      sep=";", na.strings="?",
      colClasses=colTypes, col.names=colNames
    )

  } else {

    # Load all observations
    df <- read.table(
      dataCSV, header=T, sep=";", na.strings="?",
      colClasses=colTypes, col.names=colNames
    )

    # Load only relevant observations
    keep <- df$Date=="1/2/2007" | df$Date=="2/2/2007"
    df <- df[keep, ]

  }

  # Add a POSIXlt date/time variable
  df$dt <- strptime(paste0(df$Date," ",df$Time),"%d/%m/%Y %H:%M:%S")

  return(df)

}

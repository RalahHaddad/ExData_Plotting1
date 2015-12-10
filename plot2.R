houseSample<- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")
x<- paste(houseSample$Date,houseSample$Time)
houseSample$Time <- strptime(x,format = "%d/%m/%Y %H:%M:%S")
png (filename = "plot2.png", width = 480, height = 480, units = "px")
with(
  houseSample,
  {
    plot(Time,Global_active_power,type="n",ylab="Global Active Power (killowatts)",xlab="")
    lines(Time,Global_active_power)
  }
)

dev.off()
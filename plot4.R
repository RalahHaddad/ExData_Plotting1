houseSample<- read.csv.sql("household_power_consumption.txt", sql = "select * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")
x<- paste(houseSample$Date,houseSample$Time)
houseSample$Time <- strptime(x,format = "%d/%m/%Y %H:%M:%S")
png (filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
with(
  houseSample,
  {
    plot(Time,Global_active_power,type="n",ylab="Global Active Power (killowatts)",xlab="")
    lines(Time,Global_active_power)
  }
)
with(
  houseSample,
  {
    plot(Time,Voltage,type="n",ylab="Voltage",xlab="datetime")
    lines(Time,Voltage)
  }
)
with(
  houseSample,
  {
    plot(Time,Sub_metering_1,type="n",ylab="Energy sub Metering",xlab="")
    lines(Time,Sub_metering_1)
    lines(Time,Sub_metering_2,col="red")
    lines(Time,Sub_metering_3,col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("black","red","blue"))
  }
)
with(
  houseSample,
  {
    plot(Time,Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
    lines(Time,Global_reactive_power)
  }
)

dev.off()
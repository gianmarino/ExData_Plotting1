plot4<-function(){
  ## Plot4 -> combines many plots into one graph
  
  ## Extraction and preparation of data. Takes from fullData and dumps it, clean, on partData
  fullData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
  fullData$Date<-as.Date(fullData[,"Date"],format="%d/%m/%Y")
  
  ## Filters data (2-day analysis)
  filt1<-fullData$Date=="2007-02-01"|fullData$Date=="2007-02-02"
  partData<-fullData[filt1,]
  temp<-paste(partData$Date,partData$Time) # Pastes date and time
  temp2<-strptime(temp,format="%Y-%m-%d %H:%M:%S") # Conversion to "real" date/time
  
  ## Defines 2x2 graph layout
  png("plot4.png",width=480, height=480)
  par(mfrow=c(2,2))
  
  ## plot 1
  plot(temp2,partData$Global_active_power,xlab=NA,ylab="Global Active Power (kilowatts)",type="n")
  lines(temp2, partData$Global_active_power, type="l")
  
  ## plot 2
  plot(temp2,partData$Voltage,xlab="datetime",ylab="Voltage",type="n")
  lines(temp2, partData$Voltage, type="l")
  
  ## plot 3
  plot(temp2,partData$Sub_metering_1,xlab=NA,ylab="Energy sub metering",type="n")
  lines(temp2, partData$Sub_metering_1, type="l")
  lines(temp2, partData$Sub_metering_2, type="l", col='red')
  lines(temp2, partData$Sub_metering_3, type="l", col='blue')
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
  
  
  ## plot 4
  plot(temp2,partData$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
  lines(temp2, partData$Global_reactive_power, type="l")
  
  dev.off()
}
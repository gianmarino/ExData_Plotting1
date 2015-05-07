plot3<-function(){
  ## Plot3 -> plots sub-metering 1,2,3 hourly
  
  ## Extraction and preparation of data. Takes from fullData and dumps it, clean, on partData
  fullData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
  fullData$Date<-as.Date(fullData[,"Date"],format="%d/%m/%Y")
   
  ## Filters data (2-day analysis)
  filt1<-fullData$Date=="2007-02-01"|fullData$Date=="2007-02-02"
  partData<-fullData[filt1,]
  temp<-paste(partData$Date,partData$Time) # Pastes date and time
  temp2<-strptime(temp,format="%Y-%m-%d %H:%M:%S") # Conversion to "real" date/time
  
  ## Defines data to be plotted
  met1<-partData$Sub_metering_1
  met2<-partData$Sub_metering_2
  met3<-partData$Sub_metering_3
  
  ## Opens device (png) and begins graphic routine. Closes device.
  png("plot3.png")
  plot(temp2,met1,xlab=NA,ylab="Energy sub metering",type="n")
  lines(temp2, met1, type="l")
  lines(temp2, met2, type="l", col='red')
  lines(temp2, met3, type="l", col='blue')
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
  dev.off()
}
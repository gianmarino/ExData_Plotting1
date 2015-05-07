plot2<-function(){
  ## Plot2 -> plots Global Active Power hourly
  
  ## Extraction and preparation of data. Takes from fullData and dumps it, clean, on partData
  fullData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
  fullData$Date<-as.Date(fullData[,"Date"],format="%d/%m/%Y")
   
  ## Filters data (2-day analysis)
  filt1<-fullData$Date=="2007-02-01"|fullData$Date=="2007-02-02"
  partData<-fullData[filt1,]
  temp<-paste(partData$Date,partData$Time) # Pastes date and time
  temp2<-strptime(temp,format="%Y-%m-%d %H:%M:%S") # Conversion to "real" date/time
  
  ## Opens device (png) and begins graphic routine. Closes device.
  png("plot2.png")
  plot(temp2,partData$Global_active_power,xlab=NA,ylab="Global Active Power (kilowatts)",type="n")
  lines(temp2, partData$Global_active_power, type="l")
  dev.off()
}